//
//  ClickingButtonWhichDisplaysLabel.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "LRAppDelegate.h"
#import "AKButtonDriver.h"
#import "AKLabelDriver.h"

UIWindow *getMainWindow() {
  return [[[UIApplication sharedApplication] delegate] window];
}

SpecBegin(ClickingButtonWhichDisplaysLabel)

describe(@"Given a button that displays a label when clicked", ^{
  
  __block AKButtonDriver *theButton;
  __block AKLabelDriver *theLabel;
  
  beforeEach(^{
    UIWindow *window = getMainWindow();
    
    theButton = [AKButtonDriver inWindow:window withTag:AppDelegateView.CLICK_ME_BUTTON];
    theLabel = [AKLabelDriver inWindow:window withTag:AppDelegateView.CLICK_ME_LABEL];
  });
  
  specify(@"we can click on the button and assert the label is visible using view tags", ^{    
    [theButton tap];

    expect([theLabel isVisible]).isGoing.toBeTruthy();
  });
  
});

SpecEnd
