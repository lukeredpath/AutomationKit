//
//  AKLabelDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKLabelDriver.h"

@implementation AKLabelDriver {
  UILabel *_label;
}

- (id)initWithLabel:(UILabel *)label
{
  if ((self = [super init])) {
    _label = label; 
  }
  return self;
}

+ (id)inWindow:(UIWindow *)window withTag:(NSInteger)tag
{
  UIView *view = [window viewWithTag:tag];
  
  if (view == nil) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Could not locate subview in window with tag %d", tag] 
                                 userInfo:nil];
  }
  
  if (![view isKindOfClass:[UILabel class]]) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException 
                                   reason:[NSString stringWithFormat:@"Expected subview of type UILabel, was %@", view] 
                                 userInfo:nil];
  }
  
  return [[self alloc] initWithLabel:(UILabel *)view];
}

- (BOOL)isVisible
{
  return ![_label isHidden];
}

@end
