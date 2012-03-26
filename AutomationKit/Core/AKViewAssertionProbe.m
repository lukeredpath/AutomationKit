//
//  AKViewAssertionProbe.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewAssertionProbe.h"

@implementation AKViewAssertionProbe {
  id<AKViewSelector> _selector;
  id<AKViewCriteria> _assertion;
  BOOL _assertionMet;
}

- (id)initWithViewSelector:(id<AKViewSelector>)selector assertion:(id<AKViewCriteria>)assertion
{
  if ((self = [super init])) {
    _selector = selector;
    _assertion = assertion;
  }
  return self;
}

- (void)probe
{
  [_selector probe];

  _assertionMet = [_selector isSatisfied] && [_assertion isSatisfiedByView:[_selector view]];
}

- (BOOL)isSatisfied
{
  return _assertionMet;
}

- (NSString *)failureDescription
{
  if (![_selector isSatisfied]) {
    return [_selector failureDescription];
  }
  return [NSString stringWithFormat:@"View from %@ was %@", _selector, [_assertion failureDescription]];
}

@end
