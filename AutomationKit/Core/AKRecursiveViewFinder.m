//
//  AKRecursiveViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKRecursiveViewFinder.h"

@implementation AKRecursiveViewFinder {
  id<AKViewCriteria> _criteria;
  id<AKViewSelector> _parentViewSelector;
  NSMutableArray *_foundViews;
}

- (id)initWithCriteria:(id<AKViewCriteria>)criteria 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  if ((self = [super init])) {
    _criteria = criteria;
    _parentViewSelector = parentViewSelector;
    _foundViews = [[NSMutableArray alloc] init];
  }
  return self;
}

- (NSArray *)views
{
  [_foundViews removeAllObjects];

  [self findViewsIn:[_parentViewSelector view] stopOnFirstMatch:NO];
  
  return [_foundViews copy];
}

- (UIView *)view
{
  [_foundViews removeAllObjects];
  
  [self findViewsIn:[_parentViewSelector view] stopOnFirstMatch:YES];
  
  if (_foundViews.count == 0) {
    return nil;
  }
  
  return [_foundViews objectAtIndex:0];
}

- (void)findViewsIn:(UIView *)parentView stopOnFirstMatch:(BOOL)stopOnFirstMatch
{
  for (UIView *childView in [parentView subviews]) {
    if ([_criteria isSatisfiedByView:childView]) {
      [_foundViews addObject:childView];
      
      if (stopOnFirstMatch) return;
    }
    [self findViewsIn:childView stopOnFirstMatch:stopOnFirstMatch];
  }
}

@end
