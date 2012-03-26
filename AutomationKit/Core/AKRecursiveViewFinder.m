//
//  AKRecursiveViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKRecursiveViewFinder.h"

@implementation AKRecursiveViewFinder {
  Class _viewType;
  id<AKViewCriteria> _criteria;
  id<AKViewSelector> _parentViewSelector;
  NSMutableArray *_foundViews;
}

- (id)initWithViewType:(Class)type
              criteria:(id<AKViewCriteria>)criteria 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  if ((self = [super init])) {
    _viewType = type;
    _criteria = criteria;
    _parentViewSelector = parentViewSelector;
    _foundViews = [[NSMutableArray alloc] init];
  }
  return self;
}

- (id)initWithCriteria:(id<AKViewCriteria>)criteria 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  return [self initWithViewType:[UIView class] criteria:criteria parentViewSelector:parentViewSelector];
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
    if ([childView isKindOfClass:_viewType] && [_criteria isSatisfiedByView:childView]) {
      [_foundViews addObject:childView];
      
      if (stopOnFirstMatch) return;
    }
    [self findViewsIn:childView stopOnFirstMatch:stopOnFirstMatch];
  }
}

@end
