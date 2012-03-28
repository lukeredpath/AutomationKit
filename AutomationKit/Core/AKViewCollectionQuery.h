//
//  AKViewCollectionQuery.h
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewDriver.h"

@interface AKViewCollectionQuery : NSObject

- (id)initWithViewType:(Class)type 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector 
           driverClass:(Class<AKViewDriver>)driverClass;

- (id<AKViewDriver>)firstWithValue:(NSString *)value forKey:(NSString *)key;

@end
