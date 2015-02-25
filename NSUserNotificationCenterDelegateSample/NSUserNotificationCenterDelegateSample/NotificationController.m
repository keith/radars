//
//  NotificationController.m
//  NSUserNotificationCenterDelegateSample
//
//  Created by Keith Smiley on 1/13/15.
//  Copyright (c) 2015 keithsmiley. All rights reserved.
//

#import "NotificationController.h"

@implementation NotificationController

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];

    return self;
}

- (void)presentNotification
{
    NSUserNotification *notification = [NSUserNotification new];
    notification.title = @"Sample Title";
    notification.informativeText = @"Sample text";

    [[NSUserNotificationCenter defaultUserNotificationCenter]
     deliverNotification:notification];
}

@end
