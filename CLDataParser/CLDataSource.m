//
//  CLDataSource
//  Clanning
//
//  Created by Dylan Foster on 12/23/11.
//  Copyright (c) 2011 Finger Lakes Community College. All rights reserved.
//

#import "CLDataSource.h"
#import "Constants.h"
#import "CLPlayerWithImageViewCell.h"
#import "CLPlayerWithImageAndClanViewCell.h"

@interface CLDataSource()

@property (nonatomic, strong) NSMutableSet *announcements;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) NSArray *previousPlayers;

@end

@implementation CLDataSource

@synthesize players = _players;
@synthesize announcements = _announcements;
@synthesize previousPlayers = _previousPlayers;
@synthesize population = _population;
@synthesize delegate = _delegate;

-(NSMutableSet *)announcements
{
    
    if ( !_announcements ) { _announcements = [NSMutableSet new]; }
    return _announcements;
    
}

-(NSMutableArray *)players
{
    
    if ( !_players ) { _players = [NSMutableArray new]; }
    return _players;
    
}

-(void)startingNewData
{
    
    [self.delegate startingNewData];
    
    self.previousPlayers = [NSArray arrayWithArray:self.players];
    
    [self.players removeAllObjects];
            
}

-(void)endedNewData
{
    
    [self.delegate endedNewData];
    
    
         
    for ( CLPlayer *player in [self getLoggedOffPlayers] )
    {
                
        [self.players removeObject:player];
        
        [_delegate removedPlayer:player];
        
    }
    
}

//Adds a new player to the data source
-(void)addPlayer:(CLPlayer *)player
{
 
    //If player is not already part of the player list
    if ( ![self.players containsObject:player] )
    {
        
        //Tells datasource delegate to perform action
        if ( ![self.previousPlayers containsObject:player] ) {
            [_delegate addedPlayer:player]; }
        
        [self.players addObject:player];
        
    }
    
}

-(void)addAnnouncement:(CLAnnouncement *)announcement
{
    
    if ( ![self.announcements containsObject:announcement] )
    {
        
        [_delegate addedAnnouncement:announcement];
        
        [self.announcements addObject:announcement];
        
    }
    
}

/**
 The number of rows in this table.
 */
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    
    return (NSInteger) [self.players count];
    
}

/**
 Returns an original, original w/ clan or compact view for a table row.
 */
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
        
   if ( [tableView.identifier isEqualToString:@"iClan"] )
   {
       
       if ( [tableColumn.identifier isEqualToString:@"imageColumn"] )
       {
           
           NSTableCellView *result = [tableView makeViewWithIdentifier:@"playerImage" owner:self];
           result.imageView.image = [self imageForRow:(NSUInteger)row];
           
           return result;
           
       }
       else if ( [tableColumn.identifier isEqualToString:@"nameColumn"] ) 
       {
           
           NSTableCellView *result = [tableView makeViewWithIdentifier:@"name" owner:self];
           result.textField.stringValue = [self nameForRow:(NSUInteger)row];
           
           if ( [self playerAtRowIsVIP:(NSUInteger)row] ) { [result.textField bind:@"textColor" toObject:[NSUserDefaultsController sharedUserDefaultsController] withKeyPath:@"values.vipColor" options:[NSDictionary dictionaryWithObject:NSUnarchiveFromDataTransformerName forKey:NSValueTransformerNameBindingOption]]; }
           else { result.textField.textColor = [NSColor controlTextColor]; }
           
           return result;
           
       }
       else if ( [tableColumn.identifier isEqualToString:@"professionColumn"] )
       {
           
           NSTableCellView *result = [tableView makeViewWithIdentifier:@"professionImage" owner:self];
           result.imageView.image = [Constants imageForProfession:(NSUInteger)[self professionForRow:(NSUInteger)row]];
           
           return result;
           
       }
       else if ( [tableColumn.identifier isEqualToString:@"clanColumn"] )
       {
           
           NSTableCellView *result = [tableView makeViewWithIdentifier:@"clan" owner:self];
           result.textField.stringValue = [self clanForRow:(NSUInteger)row];
           
           return result;
           
       }
       else if ( [tableColumn.identifier isEqualToString:@"timeClanningColumn"] )
       {
           
           NSTableCellView *result = [tableView makeViewWithIdentifier:@"timeClanning" owner:self];
           result.textField.stringValue = [self clanningTimeForRow:(NSUInteger)row];
           
           return result;
           
       }
       else if ( [tableColumn.identifier isEqualToString:@"vipColumn"] )
       {
           
           NSButton *result = [tableView makeViewWithIdentifier:@"vipButton" owner:self];
           result.state = [self playerAtRowIsVIP:(NSUInteger)row];
           
           return result;
           
       }
       
       return nil;
       
   }
        
    CLPlayerWithImageViewCell *result;
    
    //If original view is selected
    if ( [[NSUserDefaults.standardUserDefaults stringForKey:@"viewType"] isEqualToString:@"Original"] )
    {
        
        //If original view with clans is selectted
        if ( [NSUserDefaults.standardUserDefaults boolForKey:@"clanInOriginalView"] )
        {
            
            //Add proper information to view, return
             CLPlayerWithImageAndClanViewCell *resultWithClan = [tableView makeViewWithIdentifier:@"largePlayerWithClanCell" owner:self];
            
            resultWithClan.image.image = [self imageForRow:(NSUInteger)row];
            
            resultWithClan.name.stringValue = [self nameForRow:(NSUInteger)row];
            
            resultWithClan.professionImage.image = [Constants imageForProfession:(NSUInteger)[self professionForRow:(NSUInteger)row]];
            
            resultWithClan.clanName.stringValue = [self clanForRow:(NSUInteger)row];
            
            if ( [self playerAtRowIsVIP:(NSUInteger)row] ) { [resultWithClan.name bind:@"textColor" toObject:[NSUserDefaultsController sharedUserDefaultsController] withKeyPath:@"values.vipColor" options:[NSDictionary dictionaryWithObject:NSUnarchiveFromDataTransformerName forKey:NSValueTransformerNameBindingOption]]; }
            else { resultWithClan.name.textColor = [NSColor controlTextColor]; }
            
            return resultWithClan;
            
        }
        
        result = [tableView makeViewWithIdentifier:@"largePlayerCell" owner:self];
        
    }
    //Compact view is selected
    else
    {
        
        result = [tableView makeViewWithIdentifier:@"smallPlayerCell" owner:self];
        
    }
    
    //Add proper information to view, return
    result.image.image = [self imageForRow:(NSUInteger)row];
    
    result.name.stringValue = [self nameForRow:(NSUInteger)row];
    if ( [self playerAtRowIsVIP:(NSUInteger)row] ) { [result.name bind:@"textColor" toObject:[NSUserDefaultsController sharedUserDefaultsController] withKeyPath:@"values.vipColor" options:[NSDictionary dictionaryWithObject:NSUnarchiveFromDataTransformerName forKey:NSValueTransformerNameBindingOption]]; }
    else { result.name.textColor = [NSColor controlTextColor]; }
    
    result.professionImage.image = [Constants imageForProfession:(NSUInteger)[self professionForRow:(NSUInteger)row]];
    
    return result;

}

-(void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    
    [self.players sortUsingDescriptors:tableView.sortDescriptors];
    
    [tableView reloadData];
    
}

/**
 Gives the view height for individual rows. Original view is taller. Compact view is shorter.
 */
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    
    //Original view
    if ( [[NSUserDefaults.standardUserDefaults stringForKey:@"viewType"] isEqualToString:@"Original"] ) { return 39; }
    //Compact view
    else if ( [[NSUserDefaults.standardUserDefaults stringForKey:@"viewType"] isEqualToString:@"Original"] ) { return 17; }
    //iClan View
    else { return 18; }
    
}

-(CLPlayer *)playerForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return nil; }
    
    return [self.players objectAtIndex:row];
    
}

/**
 Gives the name of a player at the given row.
 Used for convenience.
 */
-(NSString *)nameForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return nil; }
    
    return [[self.players objectAtIndex:row] name];
    
}

/**
 Gives the clan of a player at the given row.
 Used for convenience.
 */
-(NSString *)clanForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return nil; }
    
    return [[self.players objectAtIndex:row] clan];
    
}

/**
 Gives the race of a player at the given row.
 Used for convenience.
 */
-(NSInteger)raceForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return -1; }
    
    return [[self.players objectAtIndex:row] race];
    
}

/**
 Gives if a player at the specified row is a VIP.
 Used for convenience.
 */
-(BOOL)playerAtRowIsVIP:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return NO; }
        
    return [[self.players objectAtIndex:row] isVIP];
    
}

/**
 Gives the sex of a player at the given row.
 Used for convenience.
 */
-(NSInteger)sexForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return -1; }
    
    return [[self.players objectAtIndex:row] sex];
    
}

/**
 Gives the image of a player at the given row.
 Used for convenience.
 */
-(NSImage *)imageForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return nil; }
    
    return [[self.players objectAtIndex:row] image];
    
}

/**
 Gives the profession of a player at the given row.
 Used for convenience.
 */
-(NSInteger)professionForRow:(NSUInteger)row
{
    
    if ( row > self.players.count ) { return -1; }
    
    return [[self.players objectAtIndex:row] profession];
    
}

/**
 Gives the time clanning of a player at the given row.
 Used for convenience.
 */
-(NSString *)clanningTimeForRow:(NSUInteger)row
{
    
    //Time constants
    const int SECONDS_IN_MINUTE = 60, SECONDS_IN_HOUR = 3600, SECONDS_IN_DAY = 86400;
    
    if ( row > self.players.count ) { return nil; }
    
    NSDate *startTime = [[self.players objectAtIndex:row] startTime];
    NSDate *currentTime = [NSDate date];
    
    //Time difference between current time and time the player started clanning
    NSTimeInterval timeClanning = [currentTime timeIntervalSinceDate:startTime];
    
    //Gets the number of days a player has been clanning
    int daysClanning = (int) timeClanning / SECONDS_IN_DAY;
    if ( daysClanning != 0 ) { timeClanning -= daysClanning * SECONDS_IN_DAY; }
    
    //Gets the number of hours a player has been clanning
    int hoursClanning = (int) timeClanning / SECONDS_IN_HOUR;
    if ( hoursClanning != 0 ) { timeClanning -= hoursClanning * SECONDS_IN_HOUR; }
    
    //Gets the number of minutes a player has been clanning
    int minutesClanning = (int) timeClanning / SECONDS_IN_MINUTE;
    
    //Creates a string representation of the time clanning
    NSString *stringTimeClanning;
    
    if ( hoursClanning == 0 ) { stringTimeClanning = [[NSString alloc] initWithFormat:@"%dm", minutesClanning]; }
    else if ( daysClanning == 0 ) { stringTimeClanning = [[NSString alloc] initWithFormat:@"%dh %dm", hoursClanning, minutesClanning]; }
    else { stringTimeClanning = [[NSString alloc] initWithFormat:@"%dd %dh %dm", daysClanning, hoursClanning, minutesClanning]; }
    
    return stringTimeClanning;
    
}

/**
 Gets players that logged off since last data update
 */
 -(NSArray *)getLoggedOffPlayers
 {
     
     if ( self.previousPlayers.count == 0 ) { return nil; }
     else {
         
         NSMutableArray *loggedPlayers = [self.previousPlayers mutableCopy];
         
         [loggedPlayers removeObjectsInArray:self.players];
         
         return [NSArray arrayWithArray:loggedPlayers];
         
     }
 
 }
 
/**
 Gets statuses from the last hour
 */
 -(NSArray *)getStatusAnnouncementsFromPreviousHour
 {		
 
     //Create date that is one hour ago
     NSDateComponents *compenents = [[NSDateComponents alloc] init];
     [compenents setHour:-1];
     
     NSDate *hourAgo = [[NSCalendar currentCalendar] dateByAddingComponents:compenents toDate:[NSDate date] options:0];
     
     NSMutableArray *newAnnouncements = [NSMutableArray array];
     
     for ( CLAnnouncement *announcement in self.announcements )
     {
         
         if ( announcement.type == ALERT && [hourAgo compare:announcement.time] == NSOrderedAscending )
         {
             
             [newAnnouncements addObject:announcement];
             
         }
         
     }

     return [NSArray arrayWithArray:newAnnouncements];
 
 }

/**
 Get current VIP players
 */
-(NSArray *)getCurrentVIPs
{
    
    NSMutableArray *VIPs = [[NSMutableArray alloc] init];
    
    for ( CLPlayer *player in self.players)
    {
        
        if ( player.isVIP ) { [VIPs addObject:player]; }
        
    }
    
    return [NSArray arrayWithArray:VIPs];
    
}

- (IBAction)vipButtonPressed:(id)sender
{
    
    NSInteger row = [_iClanTable rowForView:sender];
    
    if ( [sender state] == NSOffState )
    {
        
        [self playerForRow:row].isVIP = NO;
            
    }
    else
    {
        
        [self playerForRow:row].isVIP = YES;
    
    }
    
    [_iClanTable reloadDataForRowIndexes:[[NSIndexSet alloc] initWithIndex:(NSUInteger)row] columnIndexes:[[NSIndexSet alloc] initWithIndex:3]];

}

@end
