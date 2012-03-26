//
//  AKButtonDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKAutomaton.h"

@interface AKButtonDriver : NSObject

- (void)tap;

@end

@interface AKButtonDriver (Factories)

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag;
+ (id)inWindow:(UIWindow *)window withTitle:(NSString *)title;

@end
