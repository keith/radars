//
//  NotificationController.h
//  NSUserNotificationCenterDelegateSample
//
//  Created by Keith Smiley on 1/13/15.
//  Copyright (c) 2015 keithsmiley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationController : NSObject <NSUserNotificationCenterDelegate>

- (void)presentNotification;

@end
