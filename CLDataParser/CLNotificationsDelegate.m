//
//  CLGrowlDelegate.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLNotificationsDelegate.h"
#import "Growl/Growl.h"
#import "Constants.h"

@interface CLNotificationsDelegate()

@property (nonatomic) double koppiDelay;
@property (nonatomic) double criusDelay;

@end
@implementation CLNotificationsDelegate

@synthesize koppiDelay = _koppiDelay;
@synthesize criusDelay = _criusDelay;

- (id)init {
    self = [super init];
    if (self) {
        
        [GrowlApplicationBridge setGrowlDelegate:self];
        
        //tell system to use default notifications if possible (Does not use notification center in 10.8)
        [GrowlApplicationBridge setShouldUseBuiltInNotifications:YES];
        
        _koppiDelay = 0;
        _criusDelay = 0;
                
    }
    return self;
}

/**
 Sends growl notification that player has begun clanning
 */
-(void)playerBeginsClanning:(CLPlayer *)player
{
    
    //If settings allow for it, send logon notification
    if ( [NSUserDefaults.standardUserDefaults boolForKey:@"logon"] )
    {
                
        if ( ![NSUserDefaults.standardUserDefaults boolForKey:@"onlyDisplayForVIPs"] )
        {
                        
            [GrowlApplicationBridge notifyWithTitle:player.name
                                        description:@"is now clanning"
                                   notificationName:@"Player starts clanning"
                                           iconData:player.image.TIFFRepresentation
                                           priority:0
                                           isSticky:NO
                                       clickContext:nil];
            
            return;
            
        }
        else if ( player.isVIP )
        {
                    
            [GrowlApplicationBridge notifyWithTitle:player.name
                                        description:@"is now clanning"
                                   notificationName:@"Player starts clanning"
                                           iconData:player.image.TIFFRepresentation
                                           priority:0
                                           isSticky:NO
                                       clickContext:nil];
            
        }
                
    }
    
}

/**
 Sends growl notification that player has stopped clanning
 */
-(void)playerStopsClanning:(CLPlayer *)player
{
    
    //If settings allow for it, send logoff notification
    if ( [NSUserDefaults.standardUserDefaults boolForKey:@"logoff"] )
    {
        
        if ( ![NSUserDefaults.standardUserDefaults boolForKey:@"onlyDisplayForVIPs"] )
        {
            
            [GrowlApplicationBridge notifyWithTitle:player.name
                                        description:@"is no longer clanning"
                                   notificationName:@"Player stops clanning"
                                           iconData:player.image.TIFFRepresentation
                                           priority:0
                                           isSticky:NO
                                       clickContext:nil];
            
            return;
            
        }
        else if ( player.isVIP )
        {
            
            [GrowlApplicationBridge notifyWithTitle:player.name
                                        description:@"is no longer clanning"
                                   notificationName:@"Player stops clanning"
                                           iconData:player.image.TIFFRepresentation
                                           priority:0
                                           isSticky:NO
                                       clickContext:nil];
            
        }
        
    }
    
}

/**
 Sends growl notification for given announcement
 */
- (void)notificationForAnnouncement:(CLAnnouncement *)announcement
{
    
    //If a notification is a status update, and settings allows for it, send status notification
    if ( announcement.type == ALERT && [NSUserDefaults.standardUserDefaults boolForKey:@"status"] )
    {
        
        [GrowlApplicationBridge notifyWithTitle:[NSString stringWithFormat:@"%@ announces:", announcement.messenger] 
                                    description:announcement.message 
                               notificationName:@"/status" 
                                       iconData:announcement.image.TIFFRepresentation
                                       priority:0 
                                       isSticky:[NSUserDefaults.standardUserDefaults boolForKey:@"sticky"] 
                                   clickContext:announcement.message];
        
    }
    //If a notification is a congratulations, and settings allows for it, send congrats notification
    else if ( announcement.type == CONGRATS && [NSUserDefaults.standardUserDefaults boolForKey:@"congratulations"] )
    {
        
        [GrowlApplicationBridge notifyWithTitle:announcement.awardee
                                    description:announcement.message 
                               notificationName:@"Congratulations" 
                                       iconData:announcement.image.TIFFRepresentation
                                       priority:0 
                                       isSticky:NO
                                   clickContext:nil];
        
    }
    //If a notification is a koppi announcement, and settings allows for it, send koppi announcement notification
    else if ( announcement.type == KOPPI && [NSUserDefaults.standardUserDefaults boolForKey:@"koppi"] )
    {
        
        if ( _koppiDelay > [NSUserDefaults.standardUserDefaults integerForKey:@"koppiInterval"] )
        {
            
            [GrowlApplicationBridge notifyWithTitle:[NSString stringWithFormat:@"%@ reports:", announcement.messenger]
                                        description:announcement.message
                                   notificationName:@"Koppi"
                                           iconData:announcement.image.TIFFRepresentation
                                           priority:0
                                           isSticky:NO
                                       clickContext:announcement.message];
            
            _koppiDelay = 0;
            
        }
        else
        {
            
            _koppiDelay += REFRESH_TIME / 60;
            
        }

    }
    //If a notification is an NPC (crius) announcement, and settings allows for it, send a crius notification
    else if ( announcement.type == NPC )
    {
        
        if ( [NSUserDefaults.standardUserDefaults boolForKey:@"crius"] )
        {
            
            if ( _criusDelay > [NSUserDefaults.standardUserDefaults integerForKey:@"criusInterval"] )
            {
                
                [GrowlApplicationBridge notifyWithTitle:announcement.messenger
                                            description:announcement.message
                                       notificationName:@"Crius"
                                               iconData:announcement.image.TIFFRepresentation
                                               priority:0
                                               isSticky:NO
                                           clickContext:nil];
                
                _criusDelay = 0;
                
            }
            //This needs updating later
            else if ( announcement.isColiseumMessage && [NSUserDefaults.standardUserDefaults boolForKey:@"alwaysShowColiseum"] )
            {
                
                [GrowlApplicationBridge notifyWithTitle:announcement.messenger
                                            description:announcement.message
                                       notificationName:@"Bunser"
                                               iconData:announcement.image.TIFFRepresentation
                                               priority:0
                                               isSticky:NO
                                           clickContext:nil];
                
            }
            else
            {
                
                _criusDelay += REFRESH_TIME / 60;
                
            }
            
        }
        
    }
    
}

/**
 Sends an example of a sticky notification
 Used in settings
 */
-(void)displayStickyExampleNotification
{
    
    [GrowlApplicationBridge notifyWithTitle:@"Example Notification" 
                                description:@"This is a sticky notification." 
                           notificationName:@"Example (Sticky)" 
                                   iconData:[[[NSImage alloc] initByReferencingFile:[[NSBundle mainBundle] pathForImageResource:@"crius.icns"]] TIFFRepresentation]
                                   priority:0 
                                   isSticky:YES 
                               clickContext:nil];
    
}

/**
 Sends an example of a non-sticky notification
 Used in settings
 */
-(void)displayNonStickyExampleNotification
{
    
    [GrowlApplicationBridge notifyWithTitle:@"Example Notification" 
                                description:@"This is a normal, non-sticky notification." 
                           notificationName:@"Example (Non-Sticky)" 
                                   iconData:[[[NSImage alloc] initByReferencingFile:[[NSBundle mainBundle] pathForImageResource:@"crius.icns"]] TIFFRepresentation]
                                   priority:0 
                                   isSticky:NO 
                               clickContext:nil];
    
}

/**
 When a notification is clicked, check that notification for a URL. If one exists, open that URL.
 */
-(void)growlNotificationWasClicked:(id)clickContext
{
    
    NSDataDetector *detect = [[NSDataDetector alloc] initWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeLink error:nil];

    [NSWorkspace.sharedWorkspace openURL:[[detect firstMatchInString:clickContext options:0 range:NSMakeRange(0, [clickContext length])] URL]];
    
}

@end
