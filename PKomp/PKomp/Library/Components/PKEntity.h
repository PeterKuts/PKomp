//
//  PKEntity.h
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

typedef NSString* PKEntityId;

@interface PKEntity : PKComponent <PKHeavyweightComponentProtocol>

@property (nonatomic, retain, readonly) PKEntityId entityId;

- (void)addComponent:(PKComponent*)component;
- (void)removeComponent:(PKComponent*)component;

@end

@interface PKEntity(PKEntityCreation)

+ (instancetype)entityWithId:(PKEntityId)entityId;
- (id)initWithId:(PKEntityId)entityId;

@end
