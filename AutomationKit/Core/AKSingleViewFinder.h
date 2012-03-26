//
//  AKSingleViewFinder.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewSelector.h"
#import "AKViewFinder.h"

@interface AKSingleViewFinder : NSObject <AKViewSelector>

- (id)initWithViewFinder:(id<AKViewFinder>)finder;

@end
