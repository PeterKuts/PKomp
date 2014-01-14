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

@implementation PKSystem(PKEvent)

- (void)postEvent:(PKEvent *)event
{
    [_notificationCenter postNotification:[event notification]];
    [super postEvent:event];
}

- (void)subscribeForEvent:(PKEventLink *)eventLink
{
    [_notificationCenter addObserver:eventLink.target
                            selector:eventLink.selector
                                name:eventLink.name
                              object:eventLink.object];
    [super subscribeForEvent:eventLink];
}

- (void)unsubscribeFromEvent:(PKEventLink *)eventLink
{
    [_notificationCenter removeObserver:eventLink.target name:eventLink.name object:eventLink.object];
    [super unsubscribeFromEvent:eventLink];
}

@end
