//
//  LRAppDelegate.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "LRAppDelegate.h"

const struct AppDelegateViewStruct AppDelegateView = {
  .CLICK_ME_BUTTON = 1,
  .CLICK_ME_LABEL  = 2
};

@implementation LRAppDelegate

@synthesize window = _window;
@synthesize theButton = _theButton;
@synthesize theLabel = _theLabel;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.theLabel.hidden = YES;
  self.theLabel.tag = AppDelegateView.CLICK_ME_LABEL;
  self.theButton.tag = AppDelegateView.CLICK_ME_BUTTON;

  [self.window makeKeyAndVisible];
  
  return YES;
}

- (IBAction)clickedButton:(id)sender 
{
  self.theLabel.hidden = NO;
}

@end
