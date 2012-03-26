//
//  AKSingleViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKSingleViewFinder.h"


@implementation AKSingleViewFinder {
  id<AKViewFinder> _viewFinder;
}

- (id)initWithViewFinder:(id<AKViewFinder>)viewFinder
{
  if ((self = [super init])) {
    _viewFinder = viewFinder;
  }
  return self;
}

- (UIView *)view
{
  NSArray *views = [_viewFinder views];
  
  if (views.count == 0) {
    return nil;
  }
  return [views objectAtIndex:0];
}

@end
