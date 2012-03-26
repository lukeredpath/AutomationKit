//
//  AKProber.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKProbe.h"


@protocol AKProber <NSObject>

- (void)checkProbe:(id<AKProbe>)probe;

@end
