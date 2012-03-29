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
  [self dismissModalViewControllerAnimated:NO];
  [self popViewControllerAnimated:NO];
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
  UIViewController *nextViewController = [[UIViewController alloc] initWithNibName:@"AKNavigationControllerNext" bundle:nil];
  nextViewController.title = @"Next View";
  
  UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(displayModal)];
  
  nextViewController.navigationItem.rightBarButtonItem = modalButton;
  
  [self pushViewController:nextViewController animated:YES];
}

- (void)displayModal
{
  UIViewController *modal = [[UIViewController alloc] initWithNibName:@"AKNavigationControllerModal" bundle:nil];  
  modal.title = @"Modal View";
  modal.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissModal:)];
  
  UINavigationController *modalNav = [[UINavigationController alloc] initWithRootViewController:modal];
  
  [self presentModalViewController:modalNav animated:YES];
}

- (IBAction)dismissModal:(id)sender
{
  [self dismissModalViewControllerAnimated:YES];
}

@end
