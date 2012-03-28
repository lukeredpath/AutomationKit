//
//  TestHelper.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"

LRAppDelegate *getAppDelegate() 
{
  return [[UIApplication sharedApplication] delegate];
}

UIWindow *getMainWindow() 
{
  return [getAppDelegate() window];
}

UIView *getRootView()
{
  return [getMainWindow().rootViewController view];
}

void loadFixtureNamed(NSString *name)
{
  [getAppDelegate() loadFixtureNamed:name];
}
