//
//  AKAnyView.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKAnyView.h"

@implementation AKAnyView

- (BOOL)isSatisfiedByView:(UIView *)view
{
  return YES;
}

@end

id<AKViewCriteria> AK_anyView(void)
{
  return [[AKAnyView alloc] init];
}
