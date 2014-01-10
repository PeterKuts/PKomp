//
//  PKEvent+NSNotification.h
//  PKomp
//
//  Created by Peter Kuts on 1/10/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface PKEvent (NSNotification)

- (NSNotification*)notification;

@end

@interface NSNotification(PKEvent)

- (PKEvent*)event;

@end
