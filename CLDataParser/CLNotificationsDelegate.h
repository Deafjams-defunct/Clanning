//
//  CLGrowlDelegate.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Growl/Growl.h"
#import "CLPlayer.h"
#import "CLAnnouncement.h"

@interface CLNotificationsDelegate : NSObject <GrowlApplicationBridgeDelegate>

-(void)playerBeginsClanning:(CLPlayer *)player;
-(void)playerStopsClanning:(CLPlayer *)player;
-(void)notificationForAnnouncement:(CLAnnouncement *)announcement;
-(void)displayStickyExampleNotification;
-(void)displayNonStickyExampleNotification;

@end
