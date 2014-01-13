//
//  PKEvent.h
//  PKomp
//
//  Created by Peter Kuts on 1/9/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface PKEvent : NSMutableDictionary

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, assign, readonly) id object;

- (void)designateObject:(id)object;

@end

@interface PKEvent(PKEventCreation)

+ (instancetype)eventWithName:(NSString*)name paramsForKeys:(id)firstParam, ... NS_REQUIRES_NIL_TERMINATION;
+ (instancetype)eventWithName:(NSString*)name capacity:(NSUInteger)capacity;
+ (instancetype)eventWithName:(NSString*)name;

- (id)initWithName:(NSString*)name paramsForKeys:(id)firstParam, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithName:(NSString*)name capacity:(NSUInteger)capacity;
- (id)initWithName:(NSString*)name;

@end
