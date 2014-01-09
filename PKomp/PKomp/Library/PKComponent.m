//
//  PKComponent.m
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import "PKComponent.h"
#import <objc/runtime.h>

@implementation PKComponent

+ (instancetype)component
{
    return [[[self alloc] init] autorelease];
}

+ (PKComponentType)type
{
    return NSStringFromClass(self);
}

- (PKComponentType)type
{
    return [[self class] type];
}

@end
