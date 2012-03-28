//
//  AKButtonDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKAbstractViewDriver.h"

@interface AKButtonDriver : AKAbstractViewDriver

- (void)tap;

@end

@interface AKButtonDriver (Factories)

+ (id)inView:(UIView *)view withTitle:(NSString *)title;

@end
