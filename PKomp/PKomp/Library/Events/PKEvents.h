//
//  PKEvents.h
//  PKomp
//
//  Created by Peter Kuts on 1/14/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#define EVENT_HANDLER_NAME(_event) \
handle##_event:

#define LINK_EVENT(_event) \
[PKEventLink eventLinkWithName:_event target:self selector:@selector(EVENT_HANDLER_NAME(_event))]

#define LINK_BC_EVENT(_event) \
[PKEventBroadcastLink eventLinkWithName:_event target:self selector:@selector(EVENT_HANDLER_NAME(_event))]

#define HANDLE_EVENT(_event) \
- (void)EVENT_HANDLER_NAME(_event)(NSNotification *)notification



#define EVENT(_event) \
extern NSString* const _event;

#include "PKEvents_Decl.h"

#undef EVENT

