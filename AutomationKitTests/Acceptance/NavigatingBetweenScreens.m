//
//  NavigatingScreens.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright 2012 LJR Software Limited. All rights reserved.
//

#import "TestHelper.h"
#import "AKApplicationDriver.h"
#import "AKNavigationBarDriver.h"
#import "AKButtonDriver.h"
#import "AKLabelDriver.h"
#import "AKWindowDriver.h"
#import "AKViewCollectionQuery.h"

SpecBegin(NavigatingScreens)

describe(@"Given an UINavigationController on the screen", ^{
  __block AKApplicationDriver *application = [AKApplicationDriver applicationDriver];
  
  beforeEach(^{
    loadFixtureNamed(@"AKNavigationController");
  });
  
  specify(@"we can click a button to take us to the next screen", ^{
    AKNavigationBarDriver *navBar = [application navigationBar];
    expect(navBar.currentTitle).to.equal(@"Root View");
    
    AKButtonDriver *button = [[application.mainWindow buttons] firstWithValue:@"Next" forKey:@"currentTitle"];
    
    [button tap];
    
    expect(navBar.currentTitle).to.equal(@"Next View");
    
    AKLabelDriver *label = [[application.mainWindow labels] firstWithValue:@"Next" forKey:@"text"];
    
    expect(label).isVisible();
  });
  
  specify(@"after going to the next screen, we can use the back button to go back", ^{
    AKButtonDriver *button = [[application.mainWindow buttons] firstWithValue:@"Next" forKey:@"currentTitle"];
    
    [button tap];

    AKNavigationBarDriver *navBar = [application navigationBar];

    [[navBar backButton] tap];
    
    expect(button).isVisible();
  });
  
  describe(@"and a second screen that displays a modal view", ^{
    specify(@"we can tap the button and display the modal", ^{
      AKButtonDriver *button = [[application.mainWindow buttons] firstWithValue:@"Next" forKey:@"currentTitle"];
      [button tapAndWait:0.5];
      
      AKButtonDriver *rightButton = [[application navigationBar] rightButton];
      [rightButton tapAndWait:0.5];

      AKLabelDriver *modalLabel = [[application.mainWindow labels] firstWithValue:@"Modal View" forKey:@"text"];
      [modalLabel isVisible];
    });
    
    specify(@"we can dismis the modal after its displayed using its left nav button", ^{
      AKButtonDriver *button = [[application.mainWindow buttons] firstWithValue:@"Next" forKey:@"currentTitle"];
      [button tapAndWait:0.5];
      
      AKButtonDriver *rightButton = [[application navigationBar] rightButton];
      [rightButton tapAndWait:0.5];
      
      AKButtonDriver *leftButton = [[application navigationBar] leftButton];
      [leftButton tap];
      
      AKLabelDriver *label = [[application.mainWindow labels] firstWithValue:@"Next" forKey:@"text"];
      expect(label).isVisible();
    });
  });
  
});


SpecEnd
