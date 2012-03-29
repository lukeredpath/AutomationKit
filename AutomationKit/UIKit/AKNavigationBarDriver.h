//
//  AKNavigationBarDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKAbstractViewDriver.h"
#import "AKButtonDriver.h"

@interface AKNavigationBarDriver : AKAbstractViewDriver

@property (nonatomic, readonly) NSString *currentTitle;
@property (nonatomic, readonly) AKButtonDriver *rightButton;
@property (nonatomic, readonly) AKButtonDriver *leftButton;
@property (nonatomic, readonly) AKButtonDriver *backButton;

@end
