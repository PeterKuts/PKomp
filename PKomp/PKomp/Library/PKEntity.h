//
//  PKEntity.h
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

typedef NSString* PKEntityId;

@interface PKEntity : PKComponent <PKHeavyweightComponentProtocol>

+ (instancetype)entityWithId:(PKEntityId)entityId;
- (id)initWithId:(PKEntityId)entityId;

@property (nonatomic, retain, readonly) PKEntityId entityId;

- (void)addComponent:(PKComponent*)component;
- (void)removeComponent:(PKComponent*)component;

@end
