//
//  AKKeyValueCriteriaTest.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKKeyValueCriteria.h"


SpecBegin(AKKeyValueCriteriaTest)

describe(@"AKKeyValueCriteria", ^{
  __block AKKeyValueCriteria *criteria;
  
  beforeEach(^{
    criteria = [[AKKeyValueCriteria alloc] initWithKey:@"text" value:@"Hello World"];
  });
  
  it(@"is satisfied by views that have the given value for a key", ^{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.text = @"Hello World";

    expect([criteria isSatisfiedByView:label]).to.beTruthy();
	});
  
  it(@"is not satisfied by views that do not have the given value for a key", ^{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.text = @"Goodbye World";
    
    expect([criteria isSatisfiedByView:label]).to.beFalsy();
	});
  
});

SpecEnd

