//
//  AKNavigationController.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKNavigationController.h"

@interface AKNavigationController ()

@end

@implementation AKNavigationController

@synthesize navigationController;

- (void)setUp
{
  
}

- (void)tearDown
{
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  UIViewController *rootViewController = [[UIViewController alloc] initWithNibName:@"AKNavigationControllerRoot" bundle:nil];
  rootViewController.title = @"Root View";
  [self pushViewController:rootViewController animated:NO];
}

- (IBAction)pushNext:(id)sender
{
  UIViewController *nextViewController = [[UIViewController alloc] init];
  nextViewController.title = @"Next View";
  [self pushViewController:nextViewController animated:YES];
}

@end
