//
//  AKNativeAutomaton.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKNativeAutomaton.h"
#import "UITouch+Synthesis.h"
#import "UIEvent+Synthesis.h"

@implementation AKNativeAutomaton

+ (id)automaton
{
  return [[self alloc] init];
}

- (void)tapView:(UIView *)view
{
  CGRect frame = view.frame;
  CGPoint centerPoint = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
  [self tapView:view atPoint:centerPoint];
}

- (void)tapView:(UIView *)view atPoint:(CGPoint)point
{
  UITouch *touch = [[UITouch alloc] initAtPoint:point inView:view];
  UIEvent *event = [UIEvent AK_touchEventWithTouch:touch];
  
  [touch setPhase:UITouchPhaseBegan];
  [[UIApplication sharedApplication] sendEvent:event];
  
  [touch setPhase:UITouchPhaseEnded];
  [[UIApplication sharedApplication] sendEvent:event];
  
  if ([touch.view isDescendantOfView:view] && [view canBecomeFirstResponder]) {
    [view becomeFirstResponder];
  }
}

@end
