//
//  AKViewMatchers.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef AK_EXPECTA_SUPPORT

#import "Expecta.h"
#import "EXPMatcher.h"

EXPMatcherInterface(_beVisible, (void));
#define beVisible _beVisible
#define beHidden  toNot.beVisible

#endif

