//
//  AKViewCriteria.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AKViewCriteria <NSObject>

- (BOOL)isSatisfiedByView:(UIView *)view;

@end
