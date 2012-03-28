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


@implementation AKButtonDriver 

@end

@implementation AKButtonDriver (Factories)
   
+ (id)inView:(UIView *)view withTitle:(NSString *)title
{
  id<AKViewSelector> parentViewSelector = [AKReferencedViewSelector selectorForView:view];
  id<AKViewSelector> buttonViewSelector = [[[AKRecursiveViewFinder alloc] initWithViewType:[UIButton class] 
                                                                                 criteria:AK_hasValueForKey(title, @"currentTitle")
                                                                       parentViewSelector:parentViewSelector] limitedToSingleView];
  
  return [[self alloc] initWithViewSelector:buttonViewSelector];
}

@end

#ifdef AK_EXPECTA_SUPPORT

#endif
