//
//  ClickingButtonWhichDisplaysLabel.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKButtonWithLabel.h"
#import "LRAppDelegate.h"
#import "AKButtonDriver.h"
#import "AKLabelDriver.h"

LRAppDelegate *getAppDelegate() {
  return [[UIApplication sharedApplication] delegate];
}

UIWindow *getMainWindow() {
  return [getAppDelegate() window];
}

UIView *getRootView()
{
  return [getMainWindow().rootViewController view];
}

SpecBegin(ClickingButtonWhichDisplaysLabel)

describe(@"Given a button that displays a label when clicked", ^{
  
  __block AKButtonDriver *theButton;
  __block AKLabelDriver *theLabel;
  
  beforeEach(^{
    [getAppDelegate() loadFixtureNamed:@"AKButtonWithLabel"];
  });
  
  specify(@"we can click on the button and assert the label is visible using view tags", ^{
    theButton = [AKButtonDriver inView:getRootView() withTag:AKButtonWithLabelView.CLICK_ME_BUTTON];
    theLabel = [AKLabelDriver inView:getRootView() withTag:AKButtonWithLabelView.CLICK_ME_LABEL];
    
    [theButton tap];

    expect(theLabel).to.beVisible();
  });
  
  specify(@"we can click on the button and assert the label is visible using property queries", ^{    
    theButton = [AKButtonDriver inView:getRootView() withTitle:@"CLICK ME"];
    theLabel = [AKLabelDriver inView:getRootView() withText:@"You Clicked Me"];

    [theButton tap];
    
    expect(theLabel).to.beVisible();
  });
  
});

SpecEnd
