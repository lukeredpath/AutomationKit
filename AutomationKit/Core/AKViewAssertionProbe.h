//
//  AKViewAssertionProbe.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKProbe.h"
#import "AKViewSelector.h"
#import "AKViewCriteria.h"

@interface AKViewAssertionProbe : NSObject <AKProbe>

- (id)initWithViewSelector:(id<AKViewSelector>)selector assertion:(id<AKViewCriteria>)assertion;

@end
