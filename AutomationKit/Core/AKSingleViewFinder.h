//
//  AKSingleViewFinder.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewFinder.h"
#import "AKViewSelector.h"


@interface AKSingleViewFinder : NSObject <AKViewSelector>

- (id)initWithViewFinder:(id<AKViewFinder>)viewFinder;

@end
