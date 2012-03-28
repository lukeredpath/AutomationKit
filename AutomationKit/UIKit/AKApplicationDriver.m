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

- (id)init
{
  if ((self = [super init])) {
    
  }
  return self;
}

- (AKWindowDriver *)mainWindow
{
  return [AKWindowDriver forMainWindow];
}

- (AKNavigationBarDriver *)navigationBar
{
  return [[self mainWindow] navigationBar];
}

@end
