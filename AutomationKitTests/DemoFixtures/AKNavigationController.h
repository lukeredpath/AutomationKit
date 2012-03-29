//
//  AKNavigationController.h
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKDemoProjectTestFixture.h"

@interface AKNavigationController : UINavigationController <AKDemoProjectTestFixture>
@property (nonatomic, strong) IBOutlet UINavigationController *navigationController;

- (IBAction)pushNext:(id)sender;
- (IBAction)dismissModal:(id)sender;
@end
