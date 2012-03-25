//
//  AKButtonDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKButtonDriver.h"
#import "AKNativeAutomaton.h"

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
  UIView *view = [window viewWithTag:tag];
  
  if (view == nil) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Could not locate subview in window with tag %d", tag] 
                                 userInfo:nil];
  }
  
  if (![view isKindOfClass:[UIButton class]]) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Expected subview of type UIButton, was %@", view] 
                                 userInfo:nil];
  }
  
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
