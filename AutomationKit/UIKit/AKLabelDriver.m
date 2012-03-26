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
#import "EXPMatcher.h"


@implementation AKLabelDriver {
  id<AKViewSelector> _selector;
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector
{
  if ((self = [super init])) {
    _selector = viewSelector;
  }
  return self;
}

- (BOOL)isVisible
{
  UILabel *label = (UILabel *)[_selector view];
  return ![label isHidden];
}

@end

@implementation AKLabelDriver (Factories)

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  id<AKViewSelector> mainWindowSelector = [AKReferencedViewSelector selectorForView:window];
  id<AKViewSelector> taggedViewSelector = [[AKTaggedViewFinder alloc] initWithTag:tag parentViewSelector:mainWindowSelector];
  
  return [[self alloc] initWithViewSelector:taggedViewSelector];
}

+ (id)inWindow:(UIWindow *)window withText:(NSString *)text
{
  id<AKViewSelector> mainWindowSelector = [AKReferencedViewSelector selectorForView:window];
  id<AKViewSelector> labelViewSelector = [[AKRecursiveViewFinder alloc] initWithViewType:[UILabel class] 
                                                                                criteria:AK_hasValueForKey(text, @"text") 
                                                                      parentViewSelector:mainWindowSelector];
  
  return [[self alloc] initWithViewSelector:labelViewSelector];
}

@end

