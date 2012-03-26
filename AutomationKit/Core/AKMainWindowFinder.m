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
  UIWindow *_mainWindow;
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

#pragma mark - AKViewSelector

- (UIView *)view
{
  [self probe];
  return _mainWindow;
}

#pragma mark - AKProbe

- (void)probe
{
  _mainWindow = [[_application delegate] window];
}

- (BOOL)isSatisfied
{
  return (_mainWindow != nil);
}

- (NSString *)failureDescription
{
  return @"Couldn't find application window";
}

@end
