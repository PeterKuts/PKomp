//
//  PKEventLink.m
//  PKomp
//
//  Created by Peter Kuts on 1/13/14.
//  Copyright (c) 2014 Peter Kuts. All rights reserved.
//

@interface PKEventLink()
{
    BOOL _objectDesignated;
}

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, assign, readwrite) id object;
@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL selector;

@end

@implementation PKEventLink

+ (instancetype)eventLinkWithName:(NSString*)name target:(id)target selectorName:(NSString*)selectorName
{
    return [[[self alloc] initWithName:name target:target selector:NSSelectorFromString(selectorName)] autorelease];
}

+ (instancetype)eventLinkWithName:(NSString*)name target:(id)target selector:(SEL)selector
{
    return [[[self alloc] initWithName:name target:target selector:selector] autorelease];
}

- (id)initWithName:(NSString*)name target:(id)target selector:(SEL)selector
{
    if (self = [super init]) {
        self.name = name;
        self.target = target;
        self.selector = selector;
    }
    return self;
}

- (void)designateObject:(id)object
{
    if (!_objectDesignated) {
        _objectDesignated = YES;
        self.object = object;
    }
}

- (void)dealloc
{
    self.name = nil;
    self.object = nil;
    self.target = nil;
    self.selector = nil;
    
    [super dealloc];
}

@end

@implementation PKEventBroadcastLink

- (void)designateObject:(id)object
{
    [super designateObject:nil];
}

@end
