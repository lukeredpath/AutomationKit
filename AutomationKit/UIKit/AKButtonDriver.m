//
//  AKButtonDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKButtonDriver.h"
#import "UITouch+Synthesis.h"
#import "UIEvent+Synthesis.h"

@implementation AKButtonDriver {
  UIButton *_button;
}

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  UIView *view = [window viewWithTag:tag];
  
  if (view == nil) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Could not locate subview in window with tag %d", tag] 
                                 userInfo:nil];
  }
  
  if (![view isKindOfClass:[UIButton class]]) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Expected subview of type UIButton, was %@", view] 
                                 userInfo:nil];
  }
  
  return [[self alloc] initWithButton:(UIButton *)view];
}

- (id)initWithButton:(UIButton *)button
{
  if ((self = [super init])) {
    _button = button;
  }
  return self;
}

- (void)tap
{
  UITouch *touch = [[UITouch alloc] initAtPoint:_button.center inView:_button];
  UIEvent *event = [UIEvent AK_touchEventWithTouch:touch];
  
  [touch setPhase:UITouchPhaseBegan];
  [[UIApplication sharedApplication] sendEvent:event];
  
  [touch setPhase:UITouchPhaseEnded];
  [[UIApplication sharedApplication] sendEvent:event];
  
  if ([touch.view isDescendantOfView:_button] && [_button canBecomeFirstResponder]) {
    [_button becomeFirstResponder];
  }
}

@end
