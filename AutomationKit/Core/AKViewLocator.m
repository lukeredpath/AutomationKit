//
//  AKViewLocator.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewLocator.h"

@implementation AKViewLocator {
  UIView *_rootView;
}

+ (id)locatorWithRootView:(UIView *)rootView
{
  return [[self alloc] initWithRootView:rootView];
}

- (id)initWithRootView:(UIView *)rootView
{
  if ((self = [super init])) {
    _rootView = rootView;
  }
  return self;
}

- (UIView *)locateSubviewWithTag:(NSInteger)tag
{
  UIView *subview = [_rootView viewWithTag:tag];
  
  if (subview == nil) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Could not locate subview in %@ with tag %d", _rootView, tag] 
                                 userInfo:nil];
  }

  return subview;
}

- (UIView *)locateSubviewWithTag:(NSInteger)tag ofType:(Class)viewType
{
  UIView *subview = [self locateSubviewWithTag:tag];
  
  if (![subview isKindOfClass:viewType]) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Expected subview of type %@, was %@", NSStringFromClass(viewType), subview] 
                                 userInfo:nil];
  }
  
  return subview;
}

@end
