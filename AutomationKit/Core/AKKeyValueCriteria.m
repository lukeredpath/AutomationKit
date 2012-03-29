//
//  AKKeyValueCriteria.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKKeyValueCriteria.h"

@implementation AKKeyValueCriteria {
  NSString *_key;
  id _value;
}

- (id)initWithKey:(NSString *)key value:(id)value
{
  if ((self = [super init])) {
    _key = key;
    _value = value;
  }
  return self;
}

- (BOOL)isSatisfiedByView:(UIView *)view
{
  id valueForKey = nil;
  
  @try {
    valueForKey = [view valueForKey:_key];
  }
  @catch (NSException *exception) {
    NSLog(@"Exception in AKKeyValueCriteria: %@", [exception description]);
  }
  
  return [valueForKey isEqual:_value];
}

- (NSString *)failureDescription
{
  return [NSString stringWithFormat:@"expected to have value %@ for key %@", _value, _key];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"with {%@: %@}", _key, _value];
}

@end

id<AKViewCriteria> AK_hasValueForKey(id value, NSString *key)
{
  return [[AKKeyValueCriteria alloc] initWithKey:key value:value];
}
