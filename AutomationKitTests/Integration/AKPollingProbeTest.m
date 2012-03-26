//
//  AKPollingProbeTest.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKProbe.h"
#import "AKPollingProber.h"

@interface BlockProbe : NSObject <AKProbe>

+ (id)probeWithBlock:(BOOL (^)(void))probeBlock;
- (id)initWithProbeBlock:(BOOL (^)(void))probeBlock;

@end

@implementation BlockProbe {
  BOOL (^_probeBlock)(void);
  BOOL _isSatisfied;
}

+ (id)probeWithBlock:(BOOL (^)(void))probeBlock
{
  return [[self alloc] initWithProbeBlock:probeBlock];
}

- (id)initWithProbeBlock:(BOOL (^)(void))probeBlock
{
  if ((self = [super init])) {
    _probeBlock = [probeBlock copy];
  }
  return self;
}

- (void)probe
{
  _isSatisfied = _probeBlock();
}

- (BOOL)isSatisfied
{
  return _isSatisfied;
}

- (NSString *)failureDescription
{
  return @"expected block to return YES";
}

@end

SpecBegin(AKPollingProbeTest)

describe(@"AKPollingProbe", ^{
  __block AKPollingProber *prober;
  
  beforeEach(^{
    prober = [[AKPollingProber alloc] initWithTimeout:0.5 pollDelay:0.1];
  });
  
  it(@"returns without error if the probe is satisfied immediately", ^{
    [prober checkProbe:[BlockProbe probeWithBlock:^{ return YES; }]];
	});
  
  it(@"returns without error if the probe is satisfied within the timeout", ^{
    __block NSInteger numberOfCalls = 0;
    
    [prober checkProbe:[BlockProbe probeWithBlock:^{ 
      if (numberOfCalls < 3) {
        numberOfCalls++;
        return NO;
      }
      else {
        return YES;
      }
    }]];
	});
  
  it(@"raises an exception if the probe is not satisfied within the timeout", ^{
    NSException *raised = nil;
    
    @try {
      [prober checkProbe:[BlockProbe probeWithBlock:^{ return NO; }]];
    }
    @catch (NSException *exception) {
      raised = exception;
    };
    
    expect(raised.name).to.equal(AKPollingProberTimedOut);
	});
});

SpecEnd
