//
//  AKAllOfCriteria.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteria.h"


@interface AKAllOfCriteria : NSObject <AKViewCriteria>

- (id)initWithCriteria:(id<AKViewCriteria>)firstCriteria, ...;

@end

#ifdef AK_SHORTHAND
#define allOf(...) [[AKAllOfCriteria alloc] initWithCriteria:__VA_ARGS__];
#endif
