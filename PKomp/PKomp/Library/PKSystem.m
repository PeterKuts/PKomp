//
//  PKSystem.m
//  PKomp
//
//  Created by Peter Kuts on 1/9/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface PKSystem()

@property (nonatomic, retain) NSNotificationCenter *notificationCenter;

@end

@implementation PKSystem

- (id)initWithId:(PKEntityId)entityId
{
    if (self = [super initWithId:entityId]) {
        self.notificationCenter = [[NSNotificationCenter new] autorelease];
    }
    return self;
}

- (void)dealloc
{
    self.notificationCenter = nil;
    
    [super dealloc];
}

@end
