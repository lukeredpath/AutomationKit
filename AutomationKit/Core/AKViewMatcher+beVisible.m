//
//  AKViewMatchers.m
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#define AK_EXPECTA_SUPPORT
#import "AKViewMatcher+beVisible.h"

//EXPMatcherImplementationBegin(_beVisible, (void)) {
//  prerequisite(^BOOL {
//    return [actual isKindOfClass:[UIView class]];
//  });
//
//  match(^BOOL {
//    return ![(UIView *)actual isHidden];
//  });
//  
//  failureMessageForTo(^NSString *{
//    return @"expected to visible";
//  });
//  
//  failureMessageForNotTo(^NSString *{
//    return @"expected to be hidden";
//  });
//}
//EXPMatcherImplementationEnd

@interface AKViewIsVisible : NSObject <EXPMatcher>
@end

@implementation AKViewIsVisible

- (BOOL)matches:(id)actual
{
  return [actual isVisible];
}

- (NSString *)failureMessageForTo:(id)actual
{
  return [NSString stringWithFormat:@"expected %@ to be visible", actual];
}

- (NSString *)failureMessageForNotTo:(id)actual
{
  return [NSString stringWithFormat:@"expected %@ to be hidden", actual];
}

@end

@implementation EXPExpect (_beVisibleMatcher)

- (void (^)(void))_beVisible
{
  return [^{
    [self applyMatcher:[[AKViewIsVisible alloc] init]];
  } copy];
}

@end
