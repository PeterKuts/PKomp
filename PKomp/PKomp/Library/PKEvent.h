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

+ (instancetype)eventWithName:(NSString*)name capacity:(NSUInteger)capacity;
+ (instancetype)eventWithName:(NSString*)name;
- (id)initWithName:(NSString*)name capacity:(NSUInteger)capacity;
- (id)initWithName:(NSString*)name;

@end

@interface PKEvent(NSDictionaryExtension)

- (NSInteger)intForKey:(id)aKey;
- (NSUInteger)uintForKey:(id)aKey;
- (float)floatForKey:(id)aKey;
- (double)doubleForKey:(id)aKey;
- (CGPoint)pointForKey:(id)aKey;
- (CGSize)sizeForKey:(id)aKey;
- (CGRect)rectForKey:(id)aKey;

@end

@interface PKEvent(NSMutableDictionaryExtension)

- (void)setInt:(NSInteger)anInteger forKey:(id <NSCopying>)aKey;
- (void)setUInt:(NSUInteger)anUInteger forKey:(id <NSCopying>)aKey;
- (void)setFloat:(float)aFloat forKey:(id <NSCopying>)aKey;
- (void)setDouble:(double)aDouble forKey:(id <NSCopying>)aKey;
- (void)setPoint:(CGPoint)aPoint forKey:(id <NSCopying>)aKey;
- (void)setSize:(CGSize)aSize forKey:(id <NSCopying>)aKey;
- (void)setRect:(CGRect)aRect forKey:(id <NSCopying>)aKey;

@end
