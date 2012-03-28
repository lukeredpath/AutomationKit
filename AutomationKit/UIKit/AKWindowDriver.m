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
  return [[AKViewCollectionQuery alloc] init];
}

@end
