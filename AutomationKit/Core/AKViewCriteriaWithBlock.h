//
//  AKViewCriteriaWithBlock.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteria.h"

typedef BOOL (^AKViewCriteriaWithBlockBlock)(UIView *);

@interface AKViewCriteriaWithBlock : NSObject <AKViewCriteria>

+ (id)criteriaWithBlock:(AKViewCriteriaWithBlockBlock)block failureDescription:(NSString *)failureDescription;

@end
