//
//  AKPollingProber.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKProber.h"

extern NSString *const AKPollingProberTimedOut;

@interface AKPollingProber : NSObject <AKProber>

- (id)initWithTimeout:(NSTimeInterval)timeout pollDelay:(NSTimeInterval)delay;

@end
