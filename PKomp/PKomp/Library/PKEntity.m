//
//  PKEntity.m
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import "PKComponent+HeavyweightSupport.h"

@interface PKEntity()
{
    NSMutableArray *_lightComponents;
    NSMutableArray *_heavyComponents;
}

@property (nonatomic, retain) NSArray *lightComponents;
@property (nonatomic, retain) NSArray *heavyComponents;
@property (nonatomic, retain, readwrite) PKEntityId entityId;

@end

@implementation PKEntity

+ (instancetype)entityWithId:(PKEntityId)entityId
{
    return [[[self alloc] initWithId:entityId] autorelease];
}

- (id)init
{
    return [self initWithId:nil];
}

- (id)initWithId:(PKEntityId)entityId
{
    if (self = [super init]) {
        self.entityId = entityId;
        self.lightComponents = [NSMutableArray array];
        self.heavyComponents = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc
{
    self.entityId = nil;
    self.lightComponents = nil;
    self.heavyComponents = nil;
    
    [super dealloc];
}

#pragma mark - Component managing

- (void)addComponent:(PKComponent*)component
{
    NSAssert(component, @"Component must be non-nil");
    [component attachToEntity:self];
    if ([component isHeavyweight]) {
        [_heavyComponents addObject:component];
        for (PKComponent *heavyComp in _heavyComponents) {
            [(PKHeavyweightComponent *)component componentAdded:heavyComp];
        }
        for (PKComponent *lightComp in _lightComponents) {
            [(PKHeavyweightComponent *)component componentAdded:lightComp];
        }
    } else {
        [_lightComponents addObject:component];
    }
    for (PKHeavyweightComponent *heavyComp in _heavyComponents) {
        [heavyComp componentAdded:component];
    }
}

- (void)removeComponent:(PKComponent*)component
{
    NSAssert(component, @"Component must be non-nil");
    for (PKHeavyweightComponent *heavyComp in _heavyComponents) {
        [heavyComp componentRemoved:component];
    }
    if ([component isHeavyweight]) {
        for (PKComponent *heavyComp in _heavyComponents) {
            [(PKHeavyweightComponent *)component componentRemoved:heavyComp];
        }
        for (PKComponent *lightComp in _lightComponents) {
            [(PKHeavyweightComponent *)component componentRemoved:lightComp];
        }
        [_heavyComponents removeObject:component];
    } else {
        [_lightComponents removeObject:component];
    }
    [component detachFromEntity:self];
}

- (void)componentAdded:(PKComponent *)component
{
    for (PKHeavyweightComponent *heavyComp in _heavyComponents) {
        [heavyComp componentAdded:component];
    }
}

- (void)componentRemoved:(PKComponent *)component
{
    for (PKHeavyweightComponent *heavyComp in _heavyComponents) {
        [heavyComp componentRemoved:component];
    }
}

- (NSString*)description
{
	return [NSString stringWithFormat:@"<%@ = %p | Id = %@>", [self class], self, _entityId];
}

@end
