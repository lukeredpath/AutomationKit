//
//  AKAbstractViewDriver.h
//  AutomationKit
//
//  Created by Luke Redpath on 28/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKViewDriver.h"
#import "AKViewCriteriaWithBlock.h"
#import "AKViewSelector.h"
#import "AKProber.h"
#import "AKAutomaton.h"

@interface AKAbstractViewDriver : NSObject <AKViewDriver> {

@protected
  id<AKViewSelector> _selector;
  id<AKAutomaton> _automaton;
  id<AKProber> _prober;
}

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector 
                 automaton:(id<AKAutomaton>)automaton 
                    prober:(id<AKProber>)prober;

- (id)initWithViewSelector:(id<AKViewSelector>)viewSelector;

#pragma mark - Assertions

- (BOOL)isVisible;

#pragma mark - Gestures

- (void)tap;
- (void)tapAndWait:(NSTimeInterval)seconds;

#pragma mark - Asynchronous Behaviour

- (BOOL)assertView:(AKViewCriteriaWithBlockBlock)block onFailure:(NSString *)failureDescription;
- (void)perform:(void (^)(UIView *))block;

- (id)inspectValueForKey:(NSString *)key; // private

+ (id<AKAutomaton>)defaultAutomaton;
+ (id<AKProber>)defaultProber;

@end

@interface AKAbstractViewDriver (Factories)

+ (id)inView:(UIView *)view withTag:(NSInteger)tag;

@end

#ifdef AK_EXPECTA_SUPPORT

#import "Expecta.h"
#import "EXPMatcher.h"

EXPMatcherInterface(isVisible, (void));

#define beVisible isVisible

#endif
