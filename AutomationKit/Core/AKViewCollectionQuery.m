//
//  AKViewCollectionQuery.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCollectionQuery.h"
#import "AKKeyValueCriteria.h"
#import "AKRecursiveViewFinder.h"


@implementation AKViewCollectionQuery {
  Class _type;
  Class<AKViewDriver> _driverClass;
  id<AKViewSelector> _parentViewSelector;
}

- (id)initWithViewType:(Class)type 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector 
           driverClass:(Class)driverClass;
{
  if ((self = [super init])) {
    _type = type;
    _driverClass = driverClass;
    _parentViewSelector = parentViewSelector;
  }
  return self;
}

- (AKViewCollectionQuery *)firstWithValue:(NSString *)value forKey:(NSString *)key
{
  id<AKViewCriteria> criteria = [[AKKeyValueCriteria alloc] initWithKey:key value:value];
  id<AKViewSelector> selector = [[[AKRecursiveViewFinder alloc] initWithViewType:_type criteria:criteria parentViewSelector:_parentViewSelector] limitedToSingleView];
  
  return [[(Class)_driverClass alloc] initWithViewSelector:selector];
}

@end
