//
//  PKComponent.h
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@class PKEntity;

@interface PKComponent : NSObject

+ (instancetype)component;

@property (nonatomic, assign, readonly) PKEntity *entity;
- (void)attachToEntity:(PKEntity*)entity;
- (void)detachFromEntity:(PKEntity*)entity;

@end

@interface PKComponent(PKEvent)

- (void)postEvent:(PKEvent*)event;
- (void)subscribeForEvent:(PKEventLink*)eventLink;
- (PKEventLink*)eventLink:(NSString*)event selector:(SEL)selector;
- (PKEventLink*)eventBroadcastLink:(NSString*)event selector:(SEL)selector;

@end
