//
//  AKViewLocatorTest.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKViewLocator.h"


SpecBegin(AKViewLocatorTest)

describe(@"AKViewLocator", ^{
  __block UIView *parentView;
  __block AKViewLocator *locator;
  
  beforeEach(^{
    parentView = [[UIView alloc] initWithFrame:CGRectZero];
    locator = [[AKViewLocator alloc] initWithRootView:parentView];
  });
  
  specify(@"locates a subview with a tag if one exists", ^{
    UIView *childView = [[UIView alloc] initWithFrame:CGRectZero];
    childView.tag = 123;
    [parentView addSubview:childView];

    expect([locator locateSubviewWithTag:123]).toEqual(childView);
  });
  
  specify(@"throws an exception if subview with a tag does not exist", ^{
    BOOL raisedException = NO;
    
    @try {
      [locator locateSubviewWithTag:123];
    }
    @catch (NSException *exception) {
      raisedException = YES;
    }
    
    expect(raisedException).toBeTruthy();
  });
  
  specify(@"locates a subview with a tag of a specific type if one exists", ^{
    UIView *childView = [[UILabel alloc] initWithFrame:CGRectZero];
    childView.tag = 123;
    [parentView addSubview:childView];
    
    expect([locator locateSubviewWithTag:123 ofType:[UILabel class]]).toEqual(childView);
  });
  
  specify(@"throws an exception if subview with a tag is not of the specified type", ^{
    UIView *childView = [[UIView alloc] initWithFrame:CGRectZero];
    childView.tag = 123;
    [parentView addSubview:childView];
    
    BOOL raisedException = NO;
    
    @try {
      [locator locateSubviewWithTag:123 ofType:[UILabel class]];
    }
    @catch (NSException *exception) {
      raisedException = YES;
    }
    
    expect(raisedException).toBeTruthy();
  });
});

SpecEnd
