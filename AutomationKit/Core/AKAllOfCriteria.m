//
//  AKAllOfCriteria.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKAllOfCriteria.h"

@implementation AKAllOfCriteria {
  NSSet *_criteria;
}

- (id)initWithCriteria:(id<AKViewCriteria>)firstCriteria, ...
{
  if ((self = [super init])) {
    NSMutableSet *criteriaList = [[NSMutableSet alloc] init];
    
    id eachCriteria;
    va_list argumentList;

    if (firstCriteria) {
      [criteriaList addObject:firstCriteria];
      
      va_start(argumentList, firstCriteria);
      
      while ((eachCriteria = va_arg(argumentList, id<AKViewCriteria>))) {
        [criteriaList addObject:eachCriteria];
      }
      va_end(argumentList);
    }
    _criteria = [criteriaList copy];
  }
  return self;
}

- (BOOL)isSatisfiedByView:(UIView *)view
{
  for (id<AKViewCriteria> criteria in _criteria) {
    if (![criteria isSatisfiedByView:view]) {
      return NO;
    }
  }
  return YES;
}

- (NSString *)failureDescription
{
  return @"expected to match all of the given criteria";
}

- (NSString *)description
{
  NSMutableString *description = [NSMutableString string];
  
  NSArray *criteriaArray = [_criteria allObjects];
  
  for (id<AKViewCriteria> criterion in criteriaArray) {
    [description appendString:[criterion description]];
    
    if (criterion != [criteriaArray lastObject]) {
      [description appendString:@" and "];
    }
  }
  return [description copy];
}

@end
