//
//  AKWindowDriver.m
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKWindowDriver.h"
#import "AKViewCollectionQuery.h"

@implementation AKWindowDriver

- (AKViewCollectionQuery *)buttons
{
  return [[AKViewCollectionQuery alloc] init];
}

@end
