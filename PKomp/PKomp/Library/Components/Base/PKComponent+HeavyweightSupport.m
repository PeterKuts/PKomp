//
//  PKComponent+HeavyweightSupport.m
//  PKomp
//
//  Created by Peter Kuts on 1/9/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import "PKComponent+HeavyweightSupport.h"

@implementation PKComponent (HeavyweightSupport)

- (PKHeavyweightComponent*)ifHeavyweight
{
    if ([self isHeavyweight]) {
        return (PKHeavyweightComponent*)self;
    } else {
        return nil;
    }
}

- (BOOL)isHeavyweight
{
    return [self conformsToProtocol:@protocol(PKHeavyweightComponentProtocol)];
}

@end
