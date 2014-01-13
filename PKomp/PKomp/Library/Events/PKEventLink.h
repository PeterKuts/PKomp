//
//  PKEventLink.h
//  PKomp
//
//  Created by Peter Kuts on 1/13/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface PKEventLink : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, assign, readonly) id object;
@property (nonatomic, assign, readonly) id target;
@property (nonatomic, assign, readonly) SEL selector;

+ (instancetype)eventLinkWithName:(NSString*)name target:(id)target selectorName:(NSString*)selectorName;
+ (instancetype)eventLinkWithName:(NSString*)name target:(id)target selector:(SEL)selector;
- (id)initWithName:(NSString*)name target:(id)target selector:(SEL)selector;

- (void)designateObject:(id)object;

@end

@interface PKEventBroadcastLink : PKEventLink

@end
