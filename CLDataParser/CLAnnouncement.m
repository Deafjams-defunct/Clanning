//
//  CLAnnouncement.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLAnnouncement.h"
#import "Constants.h"

@implementation CLAnnouncement

@synthesize type = _type;
@synthesize time = _time;
@synthesize messenger = _messenger;
@synthesize message = _message;
@synthesize awardee = _awardee;
@synthesize image = _image;

-(NSImage *)image
{
    
    //Each announcement type has a proper icon. Returns each type's respective icon.
    if ( _type == KOPPI ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"koppi.png"]]; }
    else if ( _type == NPC && [_messenger isEqualToString:@"Crius"] )
    {
        
        if ( self.isColiseumMessage )
        {
            
            return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"bunser.png"]];
            
        }
        
        return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"crius.png"]];
    
    }
    else if ( _type == ALERT ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"sentinel.png"]]; }
    else if ( _type == CONGRATS && [_messenger isEqualToString:@"Glory"] ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"glory.png"]]; }
    else if ( _type == CONGRATS && [_messenger isEqualToString:@"Honor"] ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"honor.png"]]; }
    else if ( _type == CONGRATS && [_messenger isEqualToString:@"Haima Myrtillus"] ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"haima.png"]]; }
    else if ( _type == CONGRATS && [_messenger isEqualToString:@"Garre Verminebane"] ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"garre.png"]]; }
    else if ( _type == CONGRATS && [_messenger isEqualToString:@"Master Champus"] ) { return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"champus.png"]]; }

    else { return nil; }
    
}

/**
 Allows for comparison between announcement objects.
 */
-(BOOL)isEqual:(id)object
{
    
    if ( object == self ) { return YES; }
    
    if ( [[object time] isEqualToDate:_time] ) { return YES; }
    
    return NO;
    
}

/**
 Allows for comparison between announcement objects.
 */
-(BOOL)isEqualTo:(id)object
{
    
    return [self isEqual:object];
    
}

/**
 Allows for comparison between announcement objects.
 */
-(NSUInteger)hash
{
    
    return [_time hash];
    
}

-(BOOL)isColiseumMessage
{
    
    if ( [_message isEqualToString:@"It’s Sombdi night, and the Coliseum will open soon."] || [_message isEqualToString:@"The Coliseum is now open."] ) { return YES; }
    
    return NO;
    
}

-(NSString *)description
{
    
    return [NSString stringWithFormat:@"message: %@, messenger: %@, awardee: %@", _message, _messenger, _awardee];
    
}

@end
