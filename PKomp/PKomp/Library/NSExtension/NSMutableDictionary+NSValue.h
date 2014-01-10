//
//  NSMutableDictionary+NSValue.h
//  PKomp
//
//  Created by Peter Kuts on 1/10/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface NSMutableDictionary (NSValue)

- (void)setInt:(NSInteger)anInteger forKey:(id <NSCopying>)aKey;
- (void)setUInt:(NSUInteger)anUInteger forKey:(id <NSCopying>)aKey;
- (void)setFloat:(float)aFloat forKey:(id <NSCopying>)aKey;
- (void)setDouble:(double)aDouble forKey:(id <NSCopying>)aKey;
- (void)setPoint:(CGPoint)aPoint forKey:(id <NSCopying>)aKey;
- (void)setSize:(CGSize)aSize forKey:(id <NSCopying>)aKey;
- (void)setRect:(CGRect)aRect forKey:(id <NSCopying>)aKey;

@end
