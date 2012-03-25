//
//  UIEvent+Synthesis.m
//  AutomationKit
//
//  Created by Luke Redpath on 25/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "UIEvent+Synthesis.h"


@interface UIEvent ()

- (void)_addTouch:(id)arg1 forDelayedDelivery:(BOOL)arg2;
- (void)_clearTouches;
- (void)_setGSEvent:(struct __GSEvent *)event;

@end

/**
 A simple proxy to act as a stand-in for the __GSEvent class
 */
@interface AKGSEventProxy : NSObject
{
@public
	unsigned int flags;
	unsigned int type;
	unsigned int ignored1;
	float x1;
	float y1;
	float x2;
	float y2;
	unsigned int ignored2[10];
	unsigned int ignored3[7];
	float sizeX;
	float sizeY;
	float x3;
	float y3;
	unsigned int ignored4[3];
}
- (id)initWithPoint:(CGPoint)point;
@end

#define kUITouchPhaseEndedEventFlag     0x1010180
#define kUITouchPhaseNotEndedEventFlag  0x3010180

@implementation UIEvent (Synthesis)

+ (UIEvent *)AK_globalTouchesEvent
{
  return [[UIApplication sharedApplication] performSelector:@selector(_touchesEvent)];
}

+ (id)AK_touchEventWithTouch:(UITouch *)touch
{
  CGPoint locationInView = [touch locationInView:touch.window];

  AKGSEventProxy *eventProxy = [[AKGSEventProxy alloc] initWithPoint:locationInView];

  eventProxy->flags = ([touch phase] == UITouchPhaseEnded) ? 
    kUITouchPhaseEndedEventFlag : kUITouchPhaseNotEndedEventFlag;
  
  UIEvent *event = [self AK_globalTouchesEvent];
  
  [event _clearTouches];
  [event _setGSEvent:(struct __GSEvent *)eventProxy];
  [event _addTouch:touch forDelayedDelivery:NO];

  return event;
}

@end

@implementation AKGSEventProxy

- (id)init
{
  if ((self = [super init])) {
    self->sizeX = 1.0;
    self->sizeY = 1.0;
    self->type = 3001;
  }
  return self;
}

- (id)initWithPoint:(CGPoint)point
{
  if ((self = [self init])) {
    self->x1 = point.x;
    self->y1 = point.y;
    self->x2 = point.x;
    self->y2 = point.y;
    self->x3 = point.x;
    self->y3 = point.y;
  }
  return self;
}

@end
