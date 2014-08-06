//
//  CLDataDelegate.m
//  Clanning
//
//  Created by Dylan Foster on 7/18/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLDataDelegate.h"

@interface CLDataDelegate()

@property (nonatomic) BOOL firstRun;

@end
@implementation CLDataDelegate

@synthesize notificationsDelegate = _notificationsDelegate;
@synthesize firstRun = _firstRun;

- (id)init
{
    self = [super init];
    if (self) {
        _firstRun = YES;
    }
    return self;
}

-(void)startingNewData {};

-(void)endedNewData
{
    
    if ( _firstRun ) { _firstRun = NO; }
    
}

-(void)addedPlayer:(CLPlayer *)player
{
    
    if ( _firstRun ) { return; }
    
    [_notificationsDelegate playerBeginsClanning:player];
    
}

-(void)removedPlayer:(CLPlayer *)player
{
    
    if ( _firstRun ) { return; }
    
    [_notificationsDelegate playerStopsClanning:player];
    
}

-(void)addedAnnouncement:(CLAnnouncement *)announcement
{
    
    if ( _firstRun ) { return; }
    
    [_notificationsDelegate notificationForAnnouncement:announcement];
    
}

@end
