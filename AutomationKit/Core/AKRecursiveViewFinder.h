//
//  AKRecursiveViewFinder.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewFinder.h"
#import "AKViewSelector.h"
#import "AKViewCriteria.h"
#import "AKProbe.h"


@interface AKRecursiveViewFinder : NSObject <AKViewFinder>

- (id)initWithViewType:(Class)type
              criteria:(id<AKViewCriteria>)criteria 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector;

- (id)initWithViewType:(Class)type 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector;

- (id)initWithCriteria:(id<AKViewCriteria>)criteria 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector;

- (id<AKViewSelector>)limitedToSingleView;

@end
