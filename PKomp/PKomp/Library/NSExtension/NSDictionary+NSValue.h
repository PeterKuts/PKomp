//
//  NSDictionary+NSValue.h
//  PKomp
//
//  Created by Peter Kuts on 1/10/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface NSDictionary (NSValue)

- (NSInteger)intForKey:(id)aKey;
- (NSUInteger)uintForKey:(id)aKey;
- (float)floatForKey:(id)aKey;
- (double)doubleForKey:(id)aKey;
- (CGPoint)pointForKey:(id)aKey;
- (CGSize)sizeForKey:(id)aKey;
- (CGRect)rectForKey:(id)aKey;

@end
