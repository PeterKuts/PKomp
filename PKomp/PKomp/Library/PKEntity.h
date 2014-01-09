//
//  PKEntity.h
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKComponent.h"

#if PK_RAW_COMPONENT_TYPES == 1
#define Component(_entity_, _class_) ((_class_*)_entity_[@#_class_])
#else
#define Component(_entity_, _class_) ((_class_*)_entity_[[_class_ type]])
#endif

typedef NSUInteger PKEntityId;

extern const PKEntityId PKEntityIdNull;


@interface PKEntity : NSObject

@property (nonatomic, assign, readonly) PKEntityId entityId;
@property (nonatomic, retain, readonly) NSDictionary *components;

+ (instancetype)entityWithId:(PKEntityId)entityId;
- (id)initWithId:(PKEntityId)entityId;

- (void)addComponent:(PKComponent*)component;
- (PKComponent*)componentByType:(PKComponentType)componentType;
- (void)removeComponentByType:(PKComponentType)componentType;
- (PKComponent*)objectForKeyedSubscript:(PKComponentType)key;

@end
