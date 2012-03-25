//
//  LRAppDelegate.h
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>


extern const struct AppDelegateViewStruct
{
  int CLICK_ME_BUTTON;
  int CLICK_ME_LABEL;
  
} AppDelegateView;

@interface LRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (weak, nonatomic) IBOutlet UIButton *theButton;
@property (weak, nonatomic) IBOutlet UILabel *theLabel;

- (IBAction)clickedButton:(id)sender;
@end
