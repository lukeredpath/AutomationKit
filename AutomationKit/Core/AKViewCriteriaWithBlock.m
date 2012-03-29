//
//  AKViewCriteriaWithBlock.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteriaWithBlock.h"

@implementation AKViewCriteriaWithBlock {
  AKViewCriteriaWithBlockBlock _block;
  NSString *_failureDescription;
}

+ (id)criteriaWithBlock:(AKViewCriteriaWithBlockBlock)block failureDescription:(NSString *)failureDescription
{
  return [[self alloc] initWithBlock:block failureDescription:(NSString *)failureDescription];
}

- (id)initWithBlock:(AKViewCriteriaWithBlockBlock)block failureDescription:(NSString *)failureDescription
{
  if ((self = [super init])) {
    _block = [block copy];
    _failureDescription = [failureDescription copy];
  }
  return self;
}

- (BOOL)isSatisfiedByView:(UIView *)view
{
  return _block(view);
}

- (NSString *)failureDescription
{
  return _failureDescription;
}

- (NSString *)description
{
  return @"satisfying criteria in block";
}

@end
