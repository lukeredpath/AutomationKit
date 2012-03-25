//
//  UIEvent+Synthesis.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEvent (Synthesis)

+ (UIEvent *)AK_globalTouchesEvent;
+ (id)AK_touchEventWithTouch:(UITouch *)touch;

@end
