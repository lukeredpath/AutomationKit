//
//  AKNavigationBarDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKNavigationBarDriver.h"
#import "AKKeyValueCriteria.h"
#import "AKRecursiveViewFinder.h"
#import "AKButtonDriver.h"

@interface AKNavigationBarDriver ()
@property (nonatomic, readonly) UIBarButtonItem *backButtonItem;
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

#pragma mark - Private

- (UIBarButtonItem *)backButtonItem
{ 
  return [self inspectValueForKey:@"backItem"];
}

@end
