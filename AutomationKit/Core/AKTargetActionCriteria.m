//
//  AKTargetActionCriteria.m
//  AutomationKit
//
//  Created by Luke Redpath on 29/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKTargetActionCriteria.h"

@implementation AKTargetActionCriteria {
  id _target;
  SEL _action;
  UIControlEvents _controlEvent;
}

- (id)initWithTarget:(id)target 
              action:(SEL)action 
     forControlEvent:(UIControlEvents)controlEvent;
{
  if ((self = [super init])) {
    _target = target;
    _action = action;
    _controlEvent = controlEvent;
  }
  return self;
}

- (BOOL)isSatisfiedByView:(UIView *)view
{
  if (![view isKindOfClass:[UIControl class]]) {
    return NO;
  }
  UIControl *control = (UIControl *)view;
  
  if (![[control allTargets] containsObject:_target]) {
    return NO;
  }
  NSArray *actionsForTarget = [control actionsForTarget:_target forControlEvent:_controlEvent];
  
  return [actionsForTarget containsObject:NSStringFromSelector(_action)];
}

- (NSString *)failureDescription
{
  return nil;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"that invokes %@ on %@ on event:%d", NSStringFromSelector(_action), _target, _controlEvent];
}

@end
