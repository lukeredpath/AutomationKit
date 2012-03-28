//
//  AKWindowDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKWindowDriver.h"
#import "AKMainWindowFinder.h"
#import "AKRecursiveViewFinder.h"
#import "AKViewCollectionQuery.h"
#import "AKButtonDriver.h"
#import "AKLabelDriver.h"

@implementation AKWindowDriver

+ (id)forMainWindow
{
  id<AKViewSelector> selector = [AKMainWindowFinder forCurrentApplication];
  return [[self alloc] initWithViewSelector:selector];
}

- (AKNavigationBarDriver *)navigationBar
{
  id<AKViewSelector> selector = [[[AKRecursiveViewFinder alloc] initWithViewType:[UINavigationBar class] parentViewSelector:_selector] limitedToSingleView];
  
  return [[AKNavigationBarDriver alloc] initWithViewSelector:selector];
}

- (AKViewCollectionQuery *)buttons
{
  return [[AKViewCollectionQuery alloc] initWithViewType:[UIButton class] 
                                      parentViewSelector:_selector 
                                             driverClass:[AKButtonDriver class]];
}

- (AKViewCollectionQuery *)labels
{
  return [[AKViewCollectionQuery alloc] initWithViewType:[UILabel class] 
                                      parentViewSelector:_selector 
                                             driverClass:[AKLabelDriver class]];
}

@end
