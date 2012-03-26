//
//  AKLabelDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKLabelDriver : NSObject

- (BOOL)isVisible;

@end

@interface AKLabelDriver (Factories)

+ (id)inView:(UIView *)view withTag:(NSInteger)tag;
+ (id)inView:(UIView *)view withText:(NSString *)text;

@end

#ifdef AK_EXPECTA_SUPPORT

#import "Expecta.h"
#import "EXPMatcher.h"

EXPMatcherInterface(isVisible, (void));

#define beVisible isVisible

#endif
