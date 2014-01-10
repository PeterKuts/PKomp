//
//  PKEvent+NSNotification.m
//  PKomp
//
//  Created by Peter Kuts on 1/10/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@implementation PKEvent (NSNotification)

- (NSNotification*)notification
{
    return [NSNotification notificationWithName:self.name object:self.object userInfo:self];
}

@end

@implementation NSNotification(PKEvent)

- (PKEvent*)event
{
    if ([self.userInfo isKindOfClass:[PKEvent class]]) {
        return (PKEvent*)self.userInfo;
    } else {
        PKEvent *event = [PKEvent eventWithName:self.name];
        [event designateObject:self.object];
        [event addEntriesFromDictionary:self.userInfo];
        return event;
    }
}

@end

