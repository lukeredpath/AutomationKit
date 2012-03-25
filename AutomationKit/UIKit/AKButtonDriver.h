//
//  AKButtonDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKButtonDriver : NSObject

- (id)initWithButton:(UIButton *)button;
+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag;

- (void)tap;

@end
