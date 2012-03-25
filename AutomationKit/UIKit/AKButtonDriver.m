//
//  AKButtonDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKButtonDriver.h"
#import "AKNativeAutomaton.h"
#import "AKViewLocator.h"


@implementation AKButtonDriver {
  UIButton *_button;
  id<AKAutomaton> _automaton;
}

+ (id<AKAutomaton>)defaultAutomaton
{
  return [AKNativeAutomaton automaton];
}

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  UIView *view = [[AKViewLocator locatorWithRootView:window] locateSubviewWithTag:tag ofType:[UIButton class]];
  return [[self alloc] initWithButton:(UIButton *)view automaton:[self defaultAutomaton]];
}

- (id)initWithButton:(UIButton *)button automaton:(id<AKAutomaton>)automaton
{
  if ((self = [super init])) {
    _button = button;
    _automaton = automaton;
  }
  return self;
}

- (void)tap
{
  [_automaton tapView:_button atPoint:_button.center];
}

@end
