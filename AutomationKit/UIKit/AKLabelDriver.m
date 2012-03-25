//
//  AKLabelDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKLabelDriver.h"
#import "AKViewLocator.h"


@implementation AKLabelDriver {
  UILabel *_label;
}

- (id)initWithLabel:(UILabel *)label
{
  if ((self = [super init])) {
    _label = label; 
  }
  return self;
}

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  UIView *view = [[AKViewLocator locatorWithRootView:window] locateSubviewWithTag:tag ofType:[UILabel class]];
  return [[self alloc] initWithLabel:(UILabel *)view];
}

- (BOOL)isVisible
{
  return ![_label isHidden];
}

@end
