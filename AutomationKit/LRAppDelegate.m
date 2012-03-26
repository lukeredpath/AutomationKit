//
//  LRAppDelegate.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "LRAppDelegate.h"

@implementation LRAppDelegate

@synthesize window = _window;
@synthesize currentFixtureController = _currentFixtureController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)loadFixtureNamed:(NSString *)fixtureName
{
  Class fixtureClass = NSClassFromString(fixtureName);
  UIViewController<AKDemoProjectTestFixture> *fixtureController = [[fixtureClass alloc] init];
  
  if (![fixtureController conformsToProtocol:@protocol(AKDemoProjectTestFixture)]) {
    @throw [NSException exceptionWithName:@"Invalid fixture controller" reason:@"Controller doesn't conform to AKDemoProjectTestFixture protocol" userInfo:nil];
  }
  
  self.currentFixtureController = fixtureController;
}

- (void)setCurrentFixtureController:(UIViewController<AKDemoProjectTestFixture> *)currentFixtureController
{
  [_currentFixtureController tearDown];
  _currentFixtureController = currentFixtureController;
  self.window.rootViewController = _currentFixtureController;
  [_currentFixtureController setUp];
}

@end
