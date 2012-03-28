//
//  AKApplicationDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKApplicationDriver.h"
#import "AKNavigationBarDriver.h"
#import "AKWindowDriver.h"

@implementation AKApplicationDriver

+ (id)applicationDriver
{
  return [[self alloc] init];
}

- (AKWindowDriver *)mainWindow
{
  return [[AKWindowDriver alloc] init];
}

- (AKNavigationBarDriver *)navigationBar
{
  return [[AKNavigationBarDriver alloc] init];
}

@end
