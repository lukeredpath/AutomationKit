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
#import "AKViewMatcher+beVisible.h"

LRAppDelegate *getAppDelegate() {
  return [[UIApplication sharedApplication] delegate];
}

UIWindow *getMainWindow() {
  return [getAppDelegate() window];
}

SpecBegin(ClickingButtonWhichDisplaysLabel)

describe(@"Given a button that displays a label when clicked", ^{
  
  __block AKButtonDriver *theButton;
  __block AKLabelDriver *theLabel;
  __block UIWindow *window;
  
  beforeEach(^{
    window = getMainWindow();
    getAppDelegate().theLabel.hidden = YES;
  });
  
  specify(@"we can click on the button and assert the label is visible using view tags", ^{
    theButton = [AKButtonDriver inWindow:window withTag:AppDelegateView.CLICK_ME_BUTTON];
    theLabel = [AKLabelDriver inWindow:window withTag:AppDelegateView.CLICK_ME_LABEL];
    
    [theButton tap];

    expect(theLabel).will.beVisible();
  });
  
  specify(@"we can click on the button and assert the label is visible using property queries", ^{    
    theButton = [AKButtonDriver inWindow:window withTitle:@"CLICK ME"];
    theLabel = [AKLabelDriver inWindow:window withText:@"You Clicked Me"];

    [theButton tap];
    
    expect(theLabel).will.beVisible();
  });
  
});

SpecEnd
