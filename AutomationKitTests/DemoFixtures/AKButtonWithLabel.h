//
//  AKButtonWithLabel.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKDemoProjectTestFixture.h"

extern const struct AKButtonWithLabelViewStruct
{
  int CLICK_ME_BUTTON;
  int CLICK_ME_LABEL;
  
} AKButtonWithLabelView;

@interface AKButtonWithLabel : UIViewController <AKDemoProjectTestFixture>

@property (weak, nonatomic) IBOutlet UIButton *theButton;
@property (weak, nonatomic) IBOutlet UILabel *theLabel;

- (IBAction)clickedButton:(id)sender;
@end
