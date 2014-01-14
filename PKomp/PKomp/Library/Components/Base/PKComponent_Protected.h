//
//  PKComponent_Protected.h
//  PKomp
//
//  Created by Peter Kuts on 1/14/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#import "PKComponent.h"

@interface PKComponent ()

- (void)attachToEntity:(PKEntity*)entity;
- (void)detachFromEntity:(PKEntity*)entity;

@end
