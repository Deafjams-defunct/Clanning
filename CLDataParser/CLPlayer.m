//
//  Player.m
//  Clanning
//
//  Created by Dylan Foster on 12/24/11.
//  Copyright (c) 2011 Finger Lakes Community College. All rights reserved.
//

#import "CLPlayer.h"
#import "Constants.h"
#import "CLVIPDataSource.h"

@interface CLPlayer()

-(NSImage *)colorizeImage:(NSImage *)image;

@end

@implementation CLPlayer

@synthesize clan = _clan;
@synthesize name = _name;
@synthesize startTime = _startTime;
@synthesize race = _race;
@synthesize sex = _sex;
@synthesize image = _image;
@synthesize colors = _colors;
@synthesize profession = _profession;
@synthesize isVIP = _isVIP;

/**
 Initializes this player's colors with an array of integers referencing colors in the all colors color table by index(See Constants).
 */
-(void)colorsWithArray:(NSArray *)colors
{
    
    NSMutableArray *mutableColors = [NSMutableArray arrayWithArray:colors];
    
    //Converting indexes of color table into NSColors
    for ( NSUInteger i = 0; i < mutableColors.count; i++ )
    {
                
        [mutableColors replaceObjectAtIndex:i 
                                 withObject:[Constants colorFromAllColorsAtIndex:(NSUInteger) [[colors objectAtIndex:i] intValue]]];
    }
    
    _colors = [NSDictionary dictionaryWithObjects:mutableColors 
                                forKeys:[NSArray arrayWithObjects:
                                         @"Hair Color 1", 
                                         @"Hair Color 2",
                                         @"Skin Color 1",
                                         @"Skin Color 2",
                                         @"Skin Color 3",
                                         @"Shirt Color 1",
                                         @"Shirt Color 2",
                                         @"Shirt Color 3",
                                         @"Skin Dye Color 1",
                                         @"Skin Dye Color 2",
                                         @"Skin Dye Color 3",
                                         @"Pants Color 1",
                                         @"Pants Color 2",
                                         @"Shoe Color",
                                         @"Belt Color 1",
                                         @"Belt Color 2",
                                         @"Accessory Color 1",
                                         @"Accessory Color 2",
                                         @"Weapon Color 1",
                                         @"Weapon Color 2",
                                         nil]];
    
    //Colorize image, now that we have the colors to do so.
    _image = [self colorizeImage:_image];
    
}

/**
 Takes in an image and replaces its colors with this player's colors.
 */
-(NSImage *)colorizeImage:(NSImage *)imageToColorize
{
    
    NSImage *workingImage = [imageToColorize copy];
            
    NSBitmapImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCGImage:[workingImage CGImageForProposedRect:nil context:nil hints:nil]];
    [_image removeRepresentation:[[_image representations] objectAtIndex:0]];
    
    //Cycling through all pixels of the image
    for ( int i = 0; i < imageRep.pixelsWide; i++ )
    {
        
        for ( int j = 0; j < imageRep.pixelsHigh; j++ )
        {
            
            //Get color at current pixel
            NSColor *pixelColor = [imageRep colorAtX:i y:j];
            
            if ( pixelColor.alphaComponent == 0 ) { continue; }
                        
            //Get name of color from palette of colors that will exist on a player sprite
            //Replace color from palette with color designed for location by player's own colors
            [imageRep setColor:[_colors objectForKey:[Constants nameForColorFromPalette:pixelColor]] atX:i y:j];
            
        }
        
    }
    
    [_image addRepresentation:imageRep];
            
    return _image;
    
}

-(void)setIsVIP:(BOOL)vip {
        
    if ( vip )
    {
        
        _isVIP = YES;
        
        [CLVIPDataSource.sharedVIPDataSource addVIP:_name];
        
    }
    else
    {
        
        _isVIP = NO;
        
        [CLVIPDataSource.sharedVIPDataSource removeVIP:_name];
        
    }
    
}

/**
 Allows for comparison between player objects.
 */
-(BOOL)isEqual:(id)object
{
    
    if ( [[object name] isEqualToString:_name] ) { return YES; }
    
    return NO;
    
}

/**
 Allows for comparison between player objects.
 */
-(BOOL)isEqualTo:(id)object
{
    
    return [self isEqual:object];
    
}

/**
 Allows for comparison between player objects.
 */
-(NSUInteger)hash
{
    
    return [_name hash];
    
}

-(NSString *)description
{
    
    return [NSString stringWithFormat:@"name: %@, isVIP: %@", _name, _isVIP ? @"YES" : @"NO"];
    
}

@end
