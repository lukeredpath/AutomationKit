//
//  AKNavigationBarDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKNavigationBarDriver.h"
#import "AKKeyValueCriteria.h"
#import "AKTargetActionCriteria.h"
#import "AKRecursiveViewFinder.h"
#import "AKButtonDriver.h"

@interface AKNavigationBarDriver ()
@property (nonatomic, readonly) UIBarButtonItem *backButtonItem;
@property (nonatomic, readonly) UIBarButtonItem *rightButtonItem;
@property (nonatomic, readonly) UIBarButtonItem *leftButtonItem;
@end

@implementation AKNavigationBarDriver

- (NSString *)currentTitle
{
  return [[self inspectValueForKey:@"topItem"] title];
}

- (AKButtonDriver *)backButton
{
  id<AKViewCriteria> criteria = [[AKKeyValueCriteria alloc] initWithKey:@"title" value:self.backButtonItem.title];
  id<AKViewSelector> selector = [[[AKRecursiveViewFinder alloc] initWithViewType:NSClassFromString(@"UINavigationItemButtonView") criteria:criteria parentViewSelector:_selector] limitedToSingleView];

  return [[AKButtonDriver alloc] initWithViewSelector:selector];
}

// the nav buttons delegate to the bar button item, which in turn calls the correct target/action

- (AKButtonDriver *)rightButton
{
  id<AKViewCriteria> criteria = [[AKTargetActionCriteria alloc] initWithTarget:self.rightButtonItem action:@selector(_sendAction:withEvent:) forControlEvent:UIControlEventTouchUpInside];
  
  id<AKViewSelector> selector = [[[AKRecursiveViewFinder alloc] initWithViewType:NSClassFromString(@"UINavigationButton") criteria:criteria parentViewSelector:_selector] limitedToSingleView];
  
  return [[AKButtonDriver alloc] initWithViewSelector:selector];
}

- (AKButtonDriver *)leftButton
{
  id<AKViewCriteria> criteria = [[AKTargetActionCriteria alloc] initWithTarget:self.leftButtonItem action:@selector(_sendAction:withEvent:) forControlEvent:UIControlEventTouchUpInside];
  
  id<AKViewSelector> selector = [[[AKRecursiveViewFinder alloc] initWithViewType:NSClassFromString(@"UINavigationButton") criteria:criteria parentViewSelector:_selector] limitedToSingleView];
  
  return [[AKButtonDriver alloc] initWithViewSelector:selector];
}

#pragma mark - Private

- (UIBarButtonItem *)backButtonItem
{ 
  return [self inspectValueForKey:@"backItem"];
}

- (UIBarButtonItem *)rightButtonItem
{
  return [[self inspectValueForKey:@"topItem"] rightBarButtonItem];
}

- (UIBarButtonItem *)leftButtonItem
{
  return [[self inspectValueForKey:@"topItem"] leftBarButtonItem];
}


@end
