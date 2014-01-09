//
//  PKComponent+HeavyweightSupport.h
//  PKomp
//
//  Created by Peter Kuts on 1/9/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

typedef PKComponent<PKHeavyweightComponentProtocol> PKHeavyweightComponent;

@interface PKComponent (HeavyweightSupport)

- (PKHeavyweightComponent *)ifHeavyweight;
- (BOOL)isHeavyweight;

@end
