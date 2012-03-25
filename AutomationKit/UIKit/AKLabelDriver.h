//
//  AKLabelDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKLabelDriver : NSObject

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag;

- (BOOL)isVisible;

@end
