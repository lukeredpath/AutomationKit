//
//  AKWindowDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKAbstractViewDriver.h"
#import "AKNavigationBarDriver.h"

@class AKViewCollectionQuery;

@interface AKWindowDriver : AKAbstractViewDriver

+ (id)forMainWindow;

- (AKNavigationBarDriver *)navigationBar;
- (AKViewCollectionQuery *)buttons;

@end
