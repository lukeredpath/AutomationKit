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


@implementation AKLabelDriver

- (BOOL)isVisible
{
  return [self assertView:^(UIView *view) {
    return (BOOL)(![view isHidden]); } onFailure:@"expected to be visible"];
}

@end

@implementation AKLabelDriver (Factories)

+ (id)inView:(UIView *)view withText:(NSString *)text
{
  id<AKViewSelector> parentViewSelector = [AKReferencedViewSelector selectorForView:view];
  id<AKViewSelector> labelViewSelector = [[[AKRecursiveViewFinder alloc] initWithViewType:[UILabel class] 
                                                                                criteria:AK_hasValueForKey(text, @"text") 
                                                                      parentViewSelector:parentViewSelector] limitedToSingleView];
  
  return [[self alloc] initWithViewSelector:labelViewSelector];
}

@end
