//
//  AKAbstractViewDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKAbstractViewDriver.h"
#import "AKNativeAutomaton.h"
#import "AKViewCriteriaWithBlock.h"
#import "AKViewAssertionProbe.h"
#import "AKPollingProber.h"
#import "AKReferencedViewSelector.h"
#import "AKTaggedViewFinder.h"


@implementation AKAbstractViewDriver

+ (id<AKAutomaton>)defaultAutomaton
{
  return [AKNativeAutomaton automaton];
}

+ (id<AKProber>)defaultProber
{
  return [[AKPollingProber alloc] init];
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector 
                 automaton:(id<AKAutomaton>)automaton 
                    prober:(id<AKProber>)prober
{
  if ((self = [super init])) {
    _selector = viewSelector;
    _automaton = automaton;
    _prober = prober;
  }
  return self;
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector
{
  return [self initWithViewSelector:viewSelector 
                          automaton:[[self class] defaultAutomaton] 
                             prober:[[self class] defaultProber]];
}


- (BOOL)assertView:(AKViewCriteriaWithBlockBlock)block onFailure:(NSString *)failureDescription
{
  AKViewCriteriaWithBlock *criteria = [AKViewCriteriaWithBlock criteriaWithBlock:block failureDescription:failureDescription];
  AKViewAssertionProbe *assertionProbe = [[AKViewAssertionProbe alloc] initWithViewSelector:_selector assertion:criteria];
  [_prober checkProbe:assertionProbe];
  return [assertionProbe isSatisfied];
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

@implementation AKAbstractViewDriver (Factories)

+ (id)inView:(UIView *)view withTag:(NSInteger)tag
{
  id<AKViewSelector> parentViewSelector = [AKReferencedViewSelector selectorForView:view];
  id<AKViewSelector> taggedViewSelector = [[AKTaggedViewFinder alloc] initWithTag:tag parentViewSelector:parentViewSelector];
  
  return [[self alloc] initWithViewSelector:taggedViewSelector];
}

@end
