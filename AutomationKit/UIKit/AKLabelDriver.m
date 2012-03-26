//
//  AKLabelDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKLabelDriver.h"
#import "AKReferencedViewSelector.h"
#import "AKTaggedViewFinder.h"
#import "AKRecursiveViewFinder.h"
#import "AKKeyValueCriteria.h"
#import "AKProber.h"
#import "AKPollingProber.h"
#import "AKViewCriteriaWithBlock.h"
#import "AKViewAssertionProbe.h"


@implementation AKLabelDriver {
  id<AKViewSelector> _selector;
  id<AKProber> _prober;
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector prober:(id<AKProber>)prober
{
  if ((self = [super init])) {
    _selector = viewSelector;
    _prober = prober;
  }
  return self;
}

- (BOOL)isVisible
{
  return [self assertView:^(UIView *view) {
    return (BOOL)(![view isHidden]); } onFailure:@"expected to be visible"];
}

- (BOOL)assertView:(AKViewCriteriaWithBlockBlock)block onFailure:(NSString *)failureDescription
{
  AKViewCriteriaWithBlock *criteria = [AKViewCriteriaWithBlock criteriaWithBlock:block failureDescription:failureDescription];
  AKViewAssertionProbe *assertionProbe = [[AKViewAssertionProbe alloc] initWithViewSelector:_selector assertion:criteria];
  [_prober checkProbe:assertionProbe];
  return [assertionProbe isSatisfied];
}

@end

@implementation AKLabelDriver (Factories)

+ (id<AKProber>)defaultProber
{
  return [[AKPollingProber alloc] init];
}

+ (id)inView:(UIView *)view withTag:(NSInteger)tag
{
  id<AKViewSelector> parentViewSelector = [AKReferencedViewSelector selectorForView:view];
  id<AKViewSelector> taggedViewSelector = [[AKTaggedViewFinder alloc] initWithTag:tag parentViewSelector:parentViewSelector];
  
  return [[self alloc] initWithViewSelector:taggedViewSelector prober:[self defaultProber]];
}

+ (id)inView:(UIView *)view withText:(NSString *)text
{
  id<AKViewSelector> parentViewSelector = [AKReferencedViewSelector selectorForView:view];
  id<AKViewSelector> labelViewSelector = [[[AKRecursiveViewFinder alloc] initWithViewType:[UILabel class] 
                                                                                criteria:AK_hasValueForKey(text, @"text") 
                                                                      parentViewSelector:parentViewSelector] limitedToSingleView];
  
  return [[self alloc] initWithViewSelector:labelViewSelector prober:[self defaultProber]];
}

@end

