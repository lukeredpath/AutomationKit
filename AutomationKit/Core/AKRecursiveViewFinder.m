//
//  AKRecursiveViewFinder.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKRecursiveViewFinder.h"
#import "AKSingleViewFinder.h"
#import "AKAnyView.h"


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

- (id)initWithViewType:(Class)type parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  return [self initWithViewType:type criteria:AK_anyView() parentViewSelector:parentViewSelector];
}

- (id)initWithCriteria:(id<AKViewCriteria>)criteria 
    parentViewSelector:(id<AKViewSelector>)parentViewSelector
{
  return [self initWithViewType:[UIView class] criteria:criteria parentViewSelector:parentViewSelector];
}

- (id<AKViewSelector>)limitedToSingleView
{
  return [[AKSingleViewFinder alloc] initWithViewFinder:self];
}

#pragma mark - AKViewFinder methods

- (NSArray *)views
{
  return [_foundViews copy];
}

#pragma mark - AKProbe

- (void)probe
{
  [_parentViewSelector probe];
  [_foundViews removeAllObjects];
  [self findViewsIn:[_parentViewSelector view]];
}

- (BOOL)isSatisfied
{
  return [_parentViewSelector isSatisfied];
}

- (NSString *)failureDescription
{
  return [NSString stringWithFormat:@"%@ %@", NSStringFromClass(_viewType), _criteria];
}

#pragma mark - Private

- (void)findViewsIn:(UIView *)parentView
{
  for (UIView *childView in [parentView subviews]) {
    if ([childView isKindOfClass:_viewType] && [_criteria isSatisfiedByView:childView]) {
      [_foundViews addObject:childView];
    }
    [self findViewsIn:childView];
  }
}

@end
