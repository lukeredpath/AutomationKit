//
//  AKViewFinder.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKProbe.h"

@protocol AKViewFinder <AKProbe>

- (NSArray *)views;

@end
