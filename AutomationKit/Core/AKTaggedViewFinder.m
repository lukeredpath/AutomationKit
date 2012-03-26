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
  UIView *_theView;
}

- (id)initWithTag:(NSInteger)tag parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  if ((self = [super init])) {
    _tag = tag;
    _parentViewSelector = parentViewSelector;
  }
  return self;
}

#pragma mark - AKViewSelector

- (UIView *)view
{
  return _theView;
}

#pragma mark - AKProbe

- (void)probe
{
  _theView = [[_parentViewSelector view] viewWithTag:_tag];
}

- (BOOL)isSatisfied
{
  return ([_parentViewSelector isSatisfied]) && (_theView != nil);
}

- (NSString *)failureDescription
{
  return [NSString stringWithFormat:@"Couldn't find subview with tag %d", _tag];
}

@end
