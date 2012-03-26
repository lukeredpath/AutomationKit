//
//  AKButtonDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKButtonDriver.h"
#import "AKNativeAutomaton.h"
#import "AKReferencedViewSelector.h"
#import "AKTaggedViewFinder.h"
#import "AKKeyValueCriteria.h"
#import "AKRecursiveViewFinder.h"


@implementation AKButtonDriver {
  id<AKViewSelector> _selector;
  id<AKAutomaton> _automaton;
}

+ (id<AKAutomaton>)defaultAutomaton
{
  return [AKNativeAutomaton automaton];
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector automaton:(id<AKAutomaton>)automaton
{
  if ((self = [super init])) {
    _selector = viewSelector;
    _automaton = automaton;
  }
  return self;
}

- (void)tap
{
  UIView *view = [_selector view];
  [_automaton tapView:view atPoint:view.center];
}

@end

@implementation AKButtonDriver (Factories)

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  id<AKViewSelector> mainWindowSelector = [AKReferencedViewSelector selectorForView:window];
  id<AKViewSelector> taggedViewSelector = [[AKTaggedViewFinder alloc] initWithTag:tag parentViewSelector:mainWindowSelector];
  
  return [[self alloc] initWithViewSelector:taggedViewSelector automaton:[self defaultAutomaton]];
}

+ (id)inWindow:(UIWindow *)window withTitle:(NSString *)title
{
  id<AKViewSelector> mainWindowSelector = [AKReferencedViewSelector selectorForView:window];
  id<AKViewSelector> buttonViewSelector = [[[AKRecursiveViewFinder alloc] initWithViewType:[UILabel class] 
                                                                                 criteria:AK_hasValueForKey(title, @"currentTitle")
                                                                       parentViewSelector:mainWindowSelector] limitedToSingleView];
  
  return [[self alloc] initWithViewSelector:buttonViewSelector automaton:[self defaultAutomaton]];
}

@end

#ifdef AK_EXPECTA_SUPPORT

#endif
