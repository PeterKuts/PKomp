//
//  NSDictionary+NSValue.m
//  PKomp
//
//  Created by Peter Kuts on 1/10/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation NSDictionary (NSValue)

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
