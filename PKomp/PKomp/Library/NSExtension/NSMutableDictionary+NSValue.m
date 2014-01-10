//
//  NSMutableDictionary+NSValue.m
//  PKomp
//
//  Created by Peter Kuts on 1/10/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation NSMutableDictionary (NSValue)

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
