//
//  AKRecursiveViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKAnyView.h"
#import "AKRecursiveViewFinder.h"
#import "AKReferencedViewSelector.h"

@interface AKNoView : NSObject <AKViewCriteria>
@end

@implementation AKNoView

- (BOOL)isSatisfiedByView:(UIView *)view
{
  return NO;
}

@end

id<AKViewCriteria> noView(void)
{
  return [[AKNoView alloc] init];
}

SpecBegin(AKRecursiveViewFinder)

describe(@"AKRecursiveViewFinder", ^{
  __block UIView *parentView;
  __block id<AKViewSelector> parentViewSelector;
  
  beforeEach(^{
    parentView = [[UIView alloc] initWithFrame:CGRectZero];
    parentViewSelector = [AKReferencedViewSelector selectorForView:parentView];
  });
  
  it(@"finds all subviews of a view matching criteria", ^{
    AKRecursiveViewFinder *finder = [[AKRecursiveViewFinder alloc] initWithCriteria:AK_anyView() parentViewSelector:parentViewSelector];
    
    UIView *childViewOne = [[UIView alloc] init];
    [parentView addSubview:childViewOne];
    
    UIView *childViewTwo = [[UIView alloc] init];
    [parentView addSubview:childViewTwo];
    
    NSArray *result = [finder views];
    
    expect(result).to.contain(childViewOne);
    expect(result).to.contain(childViewTwo);
  });
  
  it(@"finds all subviews of a view matching criteria recursively", ^{
    AKRecursiveViewFinder *finder = [[AKRecursiveViewFinder alloc] initWithCriteria:AK_anyView() parentViewSelector:parentViewSelector];
    
    UIView *childView = [[UIView alloc] init];
    [parentView addSubview:childView];
    
    UIView *subChildView = [[UIView alloc] init];
    [childView addSubview:subChildView];
    
    NSArray *result = [finder views];
    
    expect(result).to.contain(childView);
    expect(result).to.contain(subChildView);
  });
  
  it(@"ignores views that do not match the given criteria", ^{
    AKRecursiveViewFinder *finder = [[AKRecursiveViewFinder alloc] initWithCriteria:noView() parentViewSelector:parentViewSelector];
    
    UIView *childView = [[UIView alloc] init];
    [parentView addSubview:childView];
    
    NSArray *result = [finder views];
    
    expect(result).willNot.contain(childView);
	});
  
});

SpecEnd
