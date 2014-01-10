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

+ (instancetype)eventWithName:(NSString*)name capacity:(NSUInteger)capacity
{
    return [[self alloc] initWithName:name capacity:capacity];
}

+ (instancetype)eventWithName:(NSString*)name
{
    return [[[self alloc] initWithName:name] autorelease];
}

- (id)initWithName:(NSString*)name
{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (id)initWithName:(NSString *)name capacity:(NSUInteger)capacity
{
    if (self = [super initWithCapacity:capacity]) {
        self.name = name;
    }
    return self;
}

- (void)dealloc
{
    self.name = nil;
    self.object = nil;
    
    [super dealloc];
}

- (void)designateObject:(id)object
{
    if (!_objectDesignated) {
        self.object = object;
        _objectDesignated = YES;
    }
}

@end

@implementation PKEvent(NSDictionaryExtension)

- (NSInteger)intForKey:(id)aKey
{
    return [[self objectForKey:aKey] integerValue];
}

- (NSUInteger)uintForKey:(id)aKey
{
    return [[self objectForKey:aKey] unsignedIntegerValue];
}

- (float)floatForKey:(id)aKey
{
    return [[self objectForKey:aKey] floatValue];
}

- (double)doubleForKey:(id)aKey;
{
    return [[self objectForKey:aKey] doubleValue];
}

- (CGPoint)pointForKey:(id)aKey
{
    return [[self objectForKey:aKey] CGPointValue];
}

- (CGSize)sizeForKey:(id)aKey
{
    return [[self objectForKey:aKey] CGSizeValue];
}

- (CGRect)rectForKey:(id)aKey
{
    return [[self objectForKey:aKey] CGRectValue];
}

@end

@implementation PKEvent(NSMutableDictionaryExtension)

- (void)setInt:(NSInteger)anInteger forKey:(id <NSCopying>)aKey
{
    [self setObject:@(anInteger) forKey:aKey];
}

- (void)setUInt:(NSUInteger)anUInteger forKey:(id <NSCopying>)aKey
{
    [self setObject:@(anUInteger) forKey:aKey];
}

- (void)setFloat:(float)aFloat forKey:(id <NSCopying>)aKey
{
    [self setObject:@(aFloat) forKey:aKey];
}

- (void)setDouble:(double)aDouble forKey:(id <NSCopying>)aKey
{
    [self setObject:@(aDouble) forKey:aKey];
}

- (void)setPoint:(CGPoint)aPoint forKey:(id <NSCopying>)aKey
{
    [self setObject:[NSValue valueWithCGPoint:aPoint] forKey:aKey];
}

- (void)setSize:(CGSize)aSize forKey:(id <NSCopying>)aKey
{
    [self setObject:[NSValue valueWithCGSize:aSize] forKey:aKey];
}

- (void)setRect:(CGRect)aRect forKey:(id <NSCopying>)aKey
{
    [self setObject:[NSValue valueWithCGRect:aRect] forKey:aKey];
}

@end
