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
  self.theButton.hidden = YES;
  self.theButton.tag = AppDelegateView.CLICK_ME_BUTTON;
  
  double delayInSeconds = 1;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    self.theButton.hidden = NO;
  });

  [self.window makeKeyAndVisible];
  
  return YES;
}

- (IBAction)clickedButton:(id)sender 
{
  double delayInSeconds = 0.3;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    self.theLabel.hidden = NO;
  });
}

@end
