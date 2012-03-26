//
//  AKViewAssertionProbeTest.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKViewAssertionProbe.h"

SpecBegin(AKViewAssertionProbeTest)

describe(@"AKViewAssertionProbe", ^{
  
  __block id<AKViewSelector> selector;
  __block id<AKViewCriteria> criteria;
  __block AKViewAssertionProbe *probe;
  
  beforeEach(^{
    selector = [automock protocolMock:@protocol(AKViewSelector)];
    criteria = [automock protocolMock:@protocol(AKViewCriteria)];
    probe = [[AKViewAssertionProbe alloc] initWithViewSelector:selector assertion:criteria];
  });
  
  it(@"is satisfied if both the selector and criteria are satisfied after probing the selector", ^{
    UIView *view = [[UIView alloc] init];
    
    check(^(that){
      [oneOf(selector) probe];
      [stub(selector) isSatisfied]; andThen(returnBool(YES));
      [stub(selector) view]; andReturn(view);
      [stub(criteria) isSatisfiedByView:view]; andThen(returnBool(YES));
    });
    
    verifyWith(^{
      [probe probe];
    });
    
    expect([probe isSatisfied]).to.beTruthy();
	});
  
  it(@"is not satisfied if the selector probe is not satisfied", ^{
    check(^(that){
      [allowing(selector) probe];
      [stub(selector) isSatisfied]; andThen(returnBool(NO));
    });
    
    verifyWith(^{
      [probe probe];
    });
    
    expect([probe isSatisfied]).to.beFalsy();
	});
  
  it(@"is not satisfied if the criteria is not satisfied", ^{
    UIView *view = [[UIView alloc] init];
    
    check(^(that){
      [allowing(selector) probe];
      [stub(selector) isSatisfied]; andThen(returnBool(YES));
      [stub(selector) view]; andReturn(view);
      [stub(criteria) isSatisfiedByView:view]; andThen(returnBool(NO));
    });

    
    verifyWith(^{
      [probe probe];
    });
    
    expect([probe isSatisfied]).to.beFalsy();
	});
  
});

SpecEnd

