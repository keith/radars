//
//  AppDelegate.m
//  NSUserNotificationCenterDelegateSample
//
//  Created by Keith Smiley on 1/13/15.
//  Copyright (c) 2015 keithsmiley. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificationController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NotificationController *controller = [NotificationController new];
    [controller presentNotification];
}

@end
