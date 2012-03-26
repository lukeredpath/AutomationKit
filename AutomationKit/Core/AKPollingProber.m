//
//  AKPollingProber.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKPollingProber.h"

NSString *const AKPollingProberTimedOut = @"AKPollingProberTimedOut";

#define kDefaultTimeoutInterval 5.0
#define kDefaultPollingDelay    0.1
#define kProbeQueueName         "co.uk.lukeredpath.AKPollingProber"

@implementation AKPollingProber {
  NSTimeInterval _timeoutInterval;
  NSTimeInterval _pollDelay;
}

- (id)initWithTimeout:(NSTimeInterval)timeout pollDelay:(NSTimeInterval)delay
{
  if ((self = [super init])) {
    _timeoutInterval = timeout;
    _pollDelay = delay;
  }
  return self;
}

- (id)init
{
  return [self initWithTimeout:kDefaultTimeoutInterval pollDelay:kDefaultPollingDelay];
}

#pragma mark - AKProber

- (void)checkProbe:(id<AKProbe>)probe
{
  if (![self poll:probe]) {
    @throw [NSException exceptionWithName:AKPollingProberTimedOut reason:[probe failureDescription] userInfo:nil];
  }
}

- (BOOL)poll:(id<AKProbe>)probe
{
  if ([probe isSatisfied]) {
    return YES;
  }
  
  dispatch_queue_t probeQueue = dispatch_queue_create(kProbeQueueName, NULL);
  
  __block BOOL continuePolling = YES;
  
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, _timeoutInterval * NSEC_PER_SEC);
  dispatch_after(popTime, probeQueue, ^(void){
    continuePolling = NO;
  });
  
  while (continuePolling) {
    dispatch_sync(probeQueue, ^{
      [probe probe];
    });
    
    if ([probe isSatisfied]) {
      return YES;
    }
    [self waitFor:_pollDelay];
  }
  return NO;
}

- (void)waitFor:(NSTimeInterval)interval
{
  CFRunLoopRunInMode(kCFRunLoopDefaultMode, (CFTimeInterval)interval, false);
}

@end
