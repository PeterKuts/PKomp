//
//  PKHeavyweightComponentProtocol.h
//  PKomp
//
//  Created by Peter Kuts on 1/9/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@protocol PKHeavyweightComponentProtocol <NSObject>

- (void)componentAdded:(PKComponent*)component;
- (void)componentRemoved:(PKComponent*)component;

@end
