//
//  AKViewDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 29/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewSelector.h"

@protocol AKViewDriver <NSObject>

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector;

@end

