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
#import "AKWindowDriver.h"
#import "AKViewCollectionQuery.h"

SpecBegin(NavigatingScreens)

describe(@"Given an UINavigationController on the screen", ^{
  
  beforeEach(^{
    loadFixtureNamed(@"AKNavigationController");
  });
  
  specify(@"we can click a button to take us to the next screen", ^{
    AKApplicationDriver *application = [AKApplicationDriver applicationDriver];

    AKNavigationBarDriver *navBar = [application navigationBar];
    expect(navBar.currentTitle).to.equal(@"Root View");
    
    AKButtonDriver *button = [[application.mainWindow buttons] firstWithValue:@"Next" forKey:@"currentTitle"];
    [button tap];
    
    expect(navBar.currentTitle).to.equal(@"Next View");
  });
  
});

SpecEnd
