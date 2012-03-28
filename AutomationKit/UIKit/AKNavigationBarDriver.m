//
//  AKNavigationBarDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKNavigationBarDriver.h"

@implementation AKNavigationBarDriver

- (NSString *)currentTitle
{
  return [self inspect:^(UIView *view) {
    UINavigationItem *topItem = [(UINavigationBar *)view topItem];
    return topItem.title;
  }];
}

@end
