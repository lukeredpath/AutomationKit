//
//  AKTypeOfView.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKTypeOfView.h"

@implementation AKTypeOfView {
  Class _klass;
}

- (id)initWithClass:(Class)viewKlass
{
  if ((self = [super init])) {
    _klass = viewKlass;
  }
  return self;
}

- (BOOL)isSatisfiedByView:(UIView *)view
{
  NSLog(@"Checking %@ is type of %@, %d", view, NSStringFromClass(_klass), [view isKindOfClass:_klass]);
  return [view isKindOfClass:_klass];
}

@end

id<AKViewCriteria> AK_isTypeOfView(Class klass)
{
  return [[AKTypeOfView alloc] initWithClass:klass];
}
