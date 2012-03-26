//
//  LRAppDelegate.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKDemoProjectTestFixture.h"

@interface LRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, strong) UIViewController<AKDemoProjectTestFixture> *currentFixtureController;

- (void)loadFixtureNamed:(NSString *)fixtureName;
@end
