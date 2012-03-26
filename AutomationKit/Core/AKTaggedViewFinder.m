//
//  AKTaggedViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKTaggedViewFinder.h"

@implementation AKTaggedViewFinder {
  NSInteger _tag;
  id<AKViewSelector> _parentViewSelector;
}

- (id)initWithTag:(NSInteger)tag parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  if ((self = [super init])) {
    _tag = tag;
    _parentViewSelector = parentViewSelector;
  }
  return self;
}

- (UIView *)view
{
  return [[_parentViewSelector view] viewWithTag:_tag];
}

@end
