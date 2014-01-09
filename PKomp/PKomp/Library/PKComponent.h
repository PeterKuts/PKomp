//
//  PKComponent.h
//  PKomp
//
//  Created by Peter Kuts on 1/8/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id<NSCopying> PKComponentType;

@interface PKComponent : NSObject

+ (instancetype)component;

+ (PKComponentType)type;
- (PKComponentType)type;

@end
