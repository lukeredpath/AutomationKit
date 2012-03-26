//
//  AKButtonWithLabel.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKButtonWithLabel.h"

const struct AKButtonWithLabelViewStruct AKButtonWithLabelView = {
  .CLICK_ME_BUTTON = 1,
  .CLICK_ME_LABEL  = 2
};

@interface AKButtonWithLabel ()

@end

@implementation AKButtonWithLabel

@synthesize theButton = _theButton;
@synthesize theLabel = _theLabel;

#pragma mark - Fixture

- (void)setUp
{
  self.theLabel.hidden = YES;
  self.theLabel.tag = AKButtonWithLabelView.CLICK_ME_LABEL;
  self.theButton.hidden = YES;
  self.theButton.tag = AKButtonWithLabelView.CLICK_ME_BUTTON;
  
  double delayInSeconds = 0.5;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    self.theButton.hidden = NO;
  });
}

- (void)tearDown
{}

#pragma mark - Actions

- (IBAction)clickedButton:(id)sender 
{
  double delayInSeconds = 0.3;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    self.theLabel.hidden = NO;
  });
}

@end
