//
//  PKEvents.h
//  PKomp
//
//  Created by Peter Kuts on 1/14/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

#define VA_NUM_ARGS(...) VA_NUM_ARGS_IMPL(__VA_ARGS__, 5, 4, 3, 2, 1)
#define VA_NUM_ARGS_IMPL(_1, _2, _3, _4, _5, N, ...) N
#define VA_PRIMITIVE_CAT(_a, ...) _a ## __VA_ARGS__


#define _EVENT_HANDLER_NAME(_event) \
handle##_event:

#define _LINK_TYPED_EVENT_CAT(_N) \
VA_PRIMITIVE_CAT(_LINK_TYPED_EVENT_, _N)

#define _LINK_TYPED_EVENT_3(_type, _event, _selector, ...) \
[_type eventLinkWithName:_event target:self selector:@selector(_selector)]

#define _LINK_TYPED_EVENT_2(_type, _event, ...) \
_LINK_TYPED_EVENT_3(_type, _event, _EVENT_HANDLER_NAME(_event))

#define _LINK_TYPED_EVENT(...) \
_LINK_TYPED_EVENT_CAT(VA_NUM_ARGS(__VA_ARGS__))(__VA_ARGS__)


#define _HANDLE_EVENT_CAT(_N, ...) \
VA_PRIMITIVE_CAT(_HANDLE_EVENT_, _N)

#define _HANDLE_EVENT_2(_event, _selector, ...) \
- (void)_selector(NSNotification *)notification

#define _HANDLE_EVENT_1(_event, ...) \
_HANDLE_EVENT_2(_event, _EVENT_HANDLER_NAME(_event))



#define LINK_EVENT(...) \
_LINK_TYPED_EVENT(PKEventLink, __VA_ARGS__)

#define LINK_BC_EVENT(...) \
_LINK_TYPED_EVENT(PKEventBroadcastLink, __VA_ARGS__)

#define HANDLE_EVENT(...) \
_HANDLE_EVENT_CAT(VA_NUM_ARGS(__VA_ARGS__))(__VA_ARGS__)



#define EVENT(_event) \
extern NSString* const _event;

#include "PKEvents_Decl.def"

#undef EVENT

