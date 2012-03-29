//
//  AKApplicationDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKNavigationBarDriver;
@class AKWindowDriver;

@interface AKApplicationDriver : NSObject

+ (id)applicationDriver;
- (void)delayFor:(NSTimeInterval)seconds;
- (AKWindowDriver *)mainWindow;
- (AKNavigationBarDriver *)navigationBar;

@end
