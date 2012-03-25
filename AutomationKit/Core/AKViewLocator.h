//
//  AKViewLocator.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKViewLocator : NSObject

+ (id)locatorWithRootView:(UIView *)rootView;
- (id)initWithRootView:(UIView *)rootView;
- (UIView *)locateSubviewWithTag:(NSInteger)tag;
- (UIView *)locateSubviewWithTag:(NSInteger)tag ofType:(Class)viewType;

@end
