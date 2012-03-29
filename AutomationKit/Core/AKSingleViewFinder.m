//
//  AKSingleViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKSingleViewFinder.h"

@implementation AKSingleViewFinder {
  id<AKViewFinder> _finder;
}

- (id)initWithViewFinder:(id<AKViewFinder>)finder
{
  if ((self = [super init])) {
    _finder = finder;
  }
  return self;
}

#pragma mark - AKViewSelector

- (UIView *)view
{
  if (![self isSatisfied]) {
    return nil;
  }
  return [[_finder views] objectAtIndex:0];
}

#pragma mark - AKProbe

- (void)probe
{
  [_finder probe];
}

- (BOOL)isSatisfied
{
  return [_finder isSatisfied] && [self onlyOneViewFound];
}

- (NSString *)failureDescription
{
  if (![_finder isSatisfied]) {
    return [_finder failureDescription];
  }
  return [NSString stringWithFormat:@"1 of %@", [_finder failureDescription]];
}

- (BOOL)onlyOneViewFound
{
  return [[_finder views] count] == 1;
}

@end
