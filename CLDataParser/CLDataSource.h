//
//  CLDataSource
//  Clanning
//
//  Created by Dylan Foster on 12/23/11.
//  Copyright (c) 2011 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLPlayer.h"
#import "CLNotificationsDelegate.h"
#import "CLVIPDataSource.h"

@protocol CLDataSourceDelegate <NSObject>
@optional
-(void)startingNewData;
-(void)endedNewData;
-(void)addedPlayer:(CLPlayer *)player;
-(void)removedPlayer:(CLPlayer *)player;
-(void)addedAnnouncement:(CLAnnouncement *)announcement;
@end

@interface CLDataSource : NSObject <NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *iClanTable;

@property (weak) IBOutlet id<CLDataSourceDelegate> delegate;
@property  int population;

-(void)addPlayer:(CLPlayer *) player;
-(void)addAnnouncement:(CLAnnouncement *)announcement;
-(void)startingNewData;
-(void)endedNewData;
-(NSArray *)getLoggedOffPlayers;
-(NSArray *)getStatusAnnouncementsFromPreviousHour;
-(NSArray *)getCurrentVIPs;

-(CLPlayer *)playerForRow:(NSUInteger)row;
-(NSString *)nameForRow:(NSUInteger)row;
-(NSString *)clanForRow:(NSUInteger)row;
-(NSInteger)raceForRow:(NSUInteger)row;
-(NSInteger)sexForRow:(NSUInteger)row;
-(NSImage *)imageForRow:(NSUInteger)row;
-(NSInteger)professionForRow:(NSUInteger)row;
-(NSString *)clanningTimeForRow:(NSUInteger)row;
-(BOOL)playerAtRowIsVIP:(NSUInteger)row;
- (IBAction)vipButtonPressed:(id)sender;

@end
