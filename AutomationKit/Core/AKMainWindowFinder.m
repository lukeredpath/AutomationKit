//
//  AKMainWindowFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKMainWindowFinder.h"

@implementation AKMainWindowFinder {
  UIApplication *_application;
}

+ (id)forCurrentApplication
{
  UIApplication *sharedApplication = [UIApplication sharedApplication];
  return [[self alloc] initWithApplication:sharedApplication];
}

- (id)initWithApplication:(UIApplication *)application
{
  if ((self = [super init])) {
    _application = application;
  }
  return self;
}

- (UIView *)view
{
  return [[_application delegate] window];
}

@end
