//
//  AKViewLocatorTest.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKTaggedViewFinder.h"
#import "AKReferencedViewSelector.h"


SpecBegin(AKTaggedViewFinderTest)

describe(@"AKTaggedViewFinder",  ^{
  __block UIView *parentView;
  __block id<AKViewSelector> parentViewSelector;
  
  beforeEach(^{
    parentView = [[UIView alloc] initWithFrame:CGRectZero];
    parentViewSelector = [AKReferencedViewSelector selectorForView:parentView];
  });
  
  specify(@"returns a view with the given tag if it exists", ^{
    AKTaggedViewFinder *taggedViewFinder = [[AKTaggedViewFinder alloc] initWithTag:123 parentViewSelector:parentViewSelector];
    
    UIView *childView = [[UIView alloc] initWithFrame:CGRectZero];
    [childView setTag:123];
    [parentView addSubview:childView];
    
    expect([taggedViewFinder view]).toEqual(childView);
  });
  
  specify(@"returns nil if a view with the given tag doesn't exists", ^{
    AKTaggedViewFinder *taggedViewFinder = [[AKTaggedViewFinder alloc] initWithTag:123 parentViewSelector:parentViewSelector];
    
    expect([taggedViewFinder view]).toBeNil();
  });
});

SpecEnd
