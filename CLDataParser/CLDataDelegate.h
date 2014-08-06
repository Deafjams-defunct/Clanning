//
//  CLDataDelegate.h
//  Clanning
//
//  Created by Dylan Foster on 7/18/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLDataSource.h"
#import "CLNotificationsDelegate.h"

@interface CLDataDelegate : NSObject <CLDataSourceDelegate>

@property (weak) IBOutlet CLNotificationsDelegate *notificationsDelegate;

@end
