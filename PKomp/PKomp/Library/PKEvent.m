//
//  PKEvent.m
//  PKomp
//
//  Created by Peter Kuts on 1/9/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKEvent()
{
    BOOL _objectDesignated;
}

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, assign, readwrite) id object;

@end

@implementation PKEvent

- (void)designateObject:(id)object
{
    if (!_objectDesignated) {
        self.object = object;
        _objectDesignated = YES;
    }
}

@end

@implementation PKEvent(PKEventCreation)

+ (instancetype)eventWithName:(NSString*)name paramsForKeys:(id)firstParam, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, firstParam);
    PKEvent *event = [[[self alloc] initWithName:name fisrtParam:firstParam args:args] autorelease];
    va_end(args);
    return event;
}

+ (instancetype)eventWithName:(NSString*)name capacity:(NSUInteger)capacity
{
    return [[self alloc] initWithName:name capacity:capacity];
}

+ (instancetype)eventWithName:(NSString*)name
{
    return [[[self alloc] initWithName:name] autorelease];
}

- (id)initWithName:(NSString*)name paramsForKeys:(id)firstParam, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, firstParam);
    PKEvent *event = [self initWithName:name fisrtParam:firstParam args:args];
    va_end(args);
    return event;
}

- (id)initWithName:(NSString *)name capacity:(NSUInteger)capacity
{
    if (self = [super initWithCapacity:capacity]) {
        self.name = name;
    }
    return self;
}

- (id)initWithName:(NSString*)name
{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (id)initWithName:(NSString*)name fisrtParam:(id)firstParam args:(va_list)args
{
    PKEvent *event = [self initWithName:name];
    
    id object = firstParam;
    id<NSCopying> key = va_arg(args, id<NSCopying>);
    while (object && key) {
        [event setObject:object forKey:key];
        object = va_arg(args, id);
        key = va_arg(args, id<NSCopying>);
    }

    return event;
}

- (void)dealloc
{
    self.name = nil;
    self.object = nil;
    
    [super dealloc];
}

@end
