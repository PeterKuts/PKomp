//
//  PKEntity.m
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import "PKEntity.h"

const PKEntityId PKEntityIdNull = NSUIntegerMax;

@interface PKEntity()
{
    NSMutableDictionary *_components;
}

@property (nonatomic, retain) NSDictionary *components;

@end

@implementation PKEntity

+ (instancetype)entityWithId:(PKEntityId)entityId
{
    return [[[self alloc] initWithId:entityId] autorelease];
}

- (id)init
{
    return [self initWithId:PKEntityIdNull];
}

- (id)initWithId:(PKEntityId)entityId
{
    if (self = [super init]) {
        _entityId = entityId;
        self.components = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)dealloc
{
    self.components = nil;
    
    [super dealloc];
}

#pragma mark - Component managing

- (void)addComponent:(PKComponent*)component
{
    NSAssert(component, @"Component must be non-nil");
    [_components setObject:component forKey:[component type]];
}

- (PKComponent*)componentByType:(PKComponentType)componentType
{
    return [_components objectForKey:componentType];
}

- (void)removeComponentByType:(PKComponentType)componentType
{
    [_components removeObjectForKey:componentType];
}

#pragma mark - ObjC subscript support

- (PKComponent*)objectForKeyedSubscript:(PKComponentType)key
{
    return [self componentByType:key];
}

@end
