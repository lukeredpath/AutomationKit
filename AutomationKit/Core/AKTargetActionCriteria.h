//
//  AKTargetActionCriteria.h
//  AutomationKit
//
//  Created by Luke Redpath on 29/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteria.h"

@interface AKTargetActionCriteria : NSObject <AKViewCriteria>

- (id)initWithTarget:(id)target 
              action:(SEL)action 
     forControlEvent:(UIControlEvents)controlEvent;

@end
