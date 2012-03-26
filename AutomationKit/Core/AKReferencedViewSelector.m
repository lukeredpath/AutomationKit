//
//  AKReferencedViewSelector.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKReferencedViewSelector.h"

@implementation AKReferencedViewSelector {
  UIView *_view;
}

+ (id)selectorForView:(UIView *)view
{
  return [[self alloc] initWithView:view];
}

- (id)initWithView:(UIView *)view
{
  if ((self = [super init])) {
    _view = view;
  }
  return self;
}

#pragma mark - AKViewSelector

- (UIView *)view
{
  return _view;
}

#pragma mark - AKProbe

- (void)probe
{
  // nothing to probe
}

- (BOOL)isSatisfied
{
  return YES;
}

@end
