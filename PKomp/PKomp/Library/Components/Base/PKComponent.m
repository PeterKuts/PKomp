//
//  PKComponent.m
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import "PKComponent_Protected.h"

@implementation PKComponent

+ (instancetype)component
{
    return [[[self alloc] init] autorelease];
}

- (void)attachToEntity:(PKEntity*)entity
{
    NSAssert(!_entity, @"Component %@ already attached to entity %@", self, _entity);
    _entity = entity;
}

- (void)detachFromEntity:(PKEntity*)entity
{
    NSAssert(_entity == entity, @"Component %@ not attached to entity %@", self, entity);
    _entity = nil;
}

- (void)onEnterSystem
{
    NSAssert(!_inSystem, @"Component %@ already in system!", self);
    _inSystem = YES;
}

- (void)onExitSystem
{
    NSAssert(_inSystem, @"Component %@ not in system!", self);
    _inSystem = NO;
}

- (NSString*)description
{
	return [NSString stringWithFormat:@"<%@ = %p>", [self class], self];
}

@end

@implementation PKComponent(PKEvent)

- (void)postEvent:(PKEvent*)event
{
    [_entity postEvent:event];
}

- (void)subscribeForEvent:(PKEventLink*)eventLink
{
    [_entity subscribeForEvent:eventLink];
}

- (void)unsubscribeFromEvent:(PKEventLink*)eventLink
{
    [_entity unsubscribeFromEvent:eventLink];
}

@end
