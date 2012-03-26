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
#import "AKProber.h"
#import "AKPollingProber.h"
#import "AKViewCriteriaWithBlock.h"
#import "AKViewAssertionProbe.h"


@implementation AKButtonDriver {
  id<AKViewSelector> _selector;
  id<AKAutomaton> _automaton;
  id<AKProber> _prober;
}

+ (id<AKAutomaton>)defaultAutomaton
{
  return [AKNativeAutomaton automaton];
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector automaton:(id<AKAutomaton>)automaton prober:(id<AKProber>)prober
{
  if ((self = [super init])) {
    _selector = viewSelector;
    _automaton = automaton;
    _prober = prober;
  }
  return self;
}

- (void)tap
{
  [self perform:^(UIView *view) {
    [_automaton tapView:view atPoint:view.center];
  }];
}

- (void)perform:(void (^)(UIView *))block
{
  AKViewCriteriaWithBlock *criteria = [AKViewCriteriaWithBlock criteriaWithBlock:^(UIView *view) {
    return (BOOL)![view isHidden];
  } failureDescription:@"expected to be visible before it can be interacted with"];
  
  AKViewAssertionProbe *assertionProbe = [[AKViewAssertionProbe alloc] initWithViewSelector:_selector assertion:criteria];
  [_prober checkProbe:assertionProbe];
  
  block([_selector view]);
}

@end

@implementation AKButtonDriver (Factories)
   
+ (id<AKProber>)defaultProber
{
  return [[AKPollingProber alloc] init];
}

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  id<AKViewSelector> mainWindowSelector = [AKReferencedViewSelector selectorForView:window];
  id<AKViewSelector> taggedViewSelector = [[AKTaggedViewFinder alloc] initWithTag:tag parentViewSelector:mainWindowSelector];
  
  return [[self alloc] initWithViewSelector:taggedViewSelector 
                                  automaton:[self defaultAutomaton] 
                                     prober:[self defaultProber]];
}

+ (id)inWindow:(UIWindow *)window withTitle:(NSString *)title
{
  id<AKViewSelector> mainWindowSelector = [AKReferencedViewSelector selectorForView:window];
  id<AKViewSelector> buttonViewSelector = [[[AKRecursiveViewFinder alloc] initWithViewType:[UIButton class] 
                                                                                 criteria:AK_hasValueForKey(title, @"currentTitle")
                                                                       parentViewSelector:mainWindowSelector] limitedToSingleView];
  
  return [[self alloc] initWithViewSelector:buttonViewSelector 
                                  automaton:[self defaultAutomaton] 
                                     prober:[self defaultProber]];
}

@end

#ifdef AK_EXPECTA_SUPPORT

#endif
