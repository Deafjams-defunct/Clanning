//
//  Constants.m
//  Clanning
//
//  Created by Dylan Foster on 5/15/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "Constants.h"
#import "NSColor+CLColorUtilities.h"

@implementation Constants

static NSDictionary *colorPalette;
static NSArray *allColors;

//Integer representation of notification preference state
NSUInteger const NONE = 0;
NSUInteger const FEW = 1;
NSUInteger const SOME = 2;
NSUInteger const STANDARD = 3;
NSUInteger const LOTS = 4;
NSUInteger const ALL = 5;
NSUInteger const CUSTOM = 6;

//Integer representation of announcement type
NSUInteger const KOPPI = 0;
NSUInteger const NPC = 1;
NSUInteger const CONGRATS = 2;
NSUInteger const ALERT = 3;

//Integer representation of profession of a player
NSUInteger const FIGHTER = 0;
NSUInteger const RANGER = 1;
NSUInteger const CHAMPION = 2;
NSUInteger const BLOODMAGE = 3;
NSUInteger const HEALER = 4;
NSUInteger const APPRENTICE_MYSTIC = 5;
NSUInteger const JOURNEYMAN_MYSTIC = 6;
NSUInteger const MYSTIC = 7;
NSUInteger const EXILE = 8;

//Integer representation of race of a player
NSUInteger const FEN = 0;
NSUInteger const ZO = 1;
NSUInteger const UNDISCLOSED = 2;
NSUInteger const THOOM = 3;
NSUInteger const SYLVAN = 4;
NSUInteger const HUMAN = 5;
NSUInteger const HALFLING = 6;
NSUInteger const DWARF = 7;

//Integer representation of sex of a player
NSUInteger const MALE = 1;
NSUInteger const FEMALE = 0;

//The time it takes for Informer to update, in seconds.
NSUInteger const REFRESH_TIME = 160;

/**
Integers representing the picture number of a player sprite in the Informer XML.
4896 - Chopper
 */
NSUInteger const EXINFERIS = 4902;
NSUInteger const TALAS = 4882;
NSUInteger const FEMALE_DWARF_0 = 459;
NSUInteger const FEMALE_DWARF_1 = 3011;
NSUInteger const FEMALE_DWARF_2 = 2951;
NSUInteger const FEMALE_FEN_0 = 457;
NSUInteger const FEMALE_FEN_1 = 3009;
NSUInteger const FEMALE_FEN_2 = 4404;
NSUInteger const FEMALE_FEN_3 = 4513;
NSUInteger const FEMALE_FEN_4 = 4405;
NSUInteger const FEMALE_HALFLING_0 = 455;
NSUInteger const FEMALE_HALFLING_1 = 3007;
NSUInteger const FEMALE_HALFLING_2 = 1426;
NSUInteger const FEMALE_HUMAN_0 = 454;
NSUInteger const FEMALE_HUMAN_1 = 3006;
NSUInteger const FEMALE_HUMAN_2 = 1934;
NSUInteger const FEMALE_HUMAN_3 = 1840;
NSUInteger const FEMALE_SYLVAN_0 = 456;
NSUInteger const FEMALE_SYLVAN_1 = 3008;
NSUInteger const FEMALE_THOOM_0 = 458;
NSUInteger const FEMALE_THOOM_1 = 3010;
NSUInteger const FEMALE_THOOM_2 = 4179;
NSUInteger const FEMALE_UNDISCLOSED_0 = 3014;
NSUInteger const FEMALE_UNDISCLOSED_1 = 1583;
NSUInteger const FEMALE_UNDISCLOSED_2 = 131;
NSUInteger const FEMALE_ZO_0 = 460;
NSUInteger const FEMALE_ZO_1 = 3012;
NSUInteger const FEMALE_ZO_2 = 3456;
NSUInteger const MALE_DWARF_0 = 452;
NSUInteger const MALE_DWARF_1 = 3004;
NSUInteger const MALE_DWARF_2 = 1839;
NSUInteger const MALE_FEN_0 = 450;
NSUInteger const MALE_FEN_1 = 3002;
NSUInteger const MALE_FEN_2 = 3665;
NSUInteger const MALE_FEN_3 = 4419;
NSUInteger const MALE_HALFLING_0 = 448;
NSUInteger const MALE_HALFLING_1 = 3000;
NSUInteger const MALE_HALFLING_2 = 189;
NSUInteger const MALE_HUMAN_0 = 447;
NSUInteger const MALE_HUMAN_1 = 2999;
NSUInteger const MALE_HUMAN_2 = 1841;
NSUInteger const MALE_HUMAN_3 = 2166;
NSUInteger const MALE_SYLVAN_0 = 449;
NSUInteger const MALE_SYLVAN_1 = 3001;
NSUInteger const MALE_THOOM_0 = 451;
NSUInteger const MALE_THOOM_1 = 3003;
NSUInteger const MALE_THOOM_2 = 4180;
NSUInteger const MALE_UNDISCLOSED_0 = 3013;
NSUInteger const MALE_UNDISCLOSED_1 = 22;
NSUInteger const MALE_ZO_0 = 453;
NSUInteger const MALE_ZO_1 = 3005;
NSUInteger const MALE_ZO_2 = 4567;

+(NSUInteger)announcmentTypeFromString:(NSString *)type;
{
    
    if ( [type isEqualToString:@"Koppi"] ) { return KOPPI; }
    else if ( [type isEqualToString:@"NPC"] ) { return NPC; }
    else if ( [type isEqualToString:@"Congrats"] ) { return CONGRATS; }
    else { return ALERT; }

}

+(NSUInteger)professionFromString:(NSString *)profession
{
    
    if ( [profession isEqualToString:@"a Fighter"] ) { return FIGHTER; }
    else if ( [profession isEqualToString:@"a Ranger"] ) { return RANGER; }
    else if ( [profession isEqualToString:@"a Champion"] ) { return CHAMPION; }
    else if ( [profession isEqualToString:@"a Bloodmage"] ) { return BLOODMAGE; }
    else if ( [profession isEqualToString:@"a Healer"] ) { return HEALER; }
    else if ( [profession isEqualToString:@"an Apprentice Mystic"] ) { return APPRENTICE_MYSTIC; }
    else if ( [profession isEqualToString:@"a Journeyman Mystic"] ) { return JOURNEYMAN_MYSTIC; }
    else if ( [profession isEqualToString:@"a Mystic"] ) { return MYSTIC; }
    else { return EXILE; }
    
}

/**
 Converts a string of data representing a race from a data source (Informer XML) to an integer representation of a race.
 */
+(NSUInteger)raceFromString:(NSString *)race
{
    
    if ( [race isEqualToString:@"a Human"] ) { return HUMAN; }
    else if ( [race isEqualToString:@"of the People"] ) { return FEN; }
    else if ( [race isEqualToString:@"a Dwarf"] ) { return DWARF; }
    else if ( [race isEqualToString:@"a Ghorak Zo"] ) { return ZO; }
    else if ( [race isEqualToString:@"a Thoom"] ) { return THOOM; }
    else if ( [race isEqualToString:@"a Sylvan"] ) { return SYLVAN; }
    else if ( [race isEqualToString:@"a Halfling"] ) { return HALFLING; }
    else { return UNDISCLOSED; }
    
}

/**
 Converts an integer representation of a race into a string representation of that race.
 */
+(NSString *)nameForRace:(NSUInteger)race;
{
    
    if ( race == HUMAN ) { return @"Human"; }
    else if ( race == FEN ) { return @"Fen"; }
    else if ( race == DWARF ) { return @"Dwarf"; }
    else if ( race == ZO ) { return @"Zo"; }
    else if ( race == THOOM ) { return @"Thoom"; }
    else if ( race == SYLVAN ) { return @"Sylvan"; }
    else if ( race == HALFLING ) { return @"Halfling"; }
    else { return @"Undisclosed"; }
    
}

/**
 Converts and integer representation of a profession into a string representation
 */
+(NSString *)nameForProfession:(NSUInteger)profession
{
    
    if ( profession == FIGHTER ) { return @"Fighter"; }
    else if ( profession == RANGER ) { return @"Ranger"; }
    else if ( profession == CHAMPION ) { return @"Champion"; }
    else if ( profession == BLOODMAGE ) { return @"Bloodmage"; }
    else if ( profession == HEALER ) { return @"Healer"; }
    else if ( profession == APPRENTICE_MYSTIC ) { return @"ApprenticeMystic"; }
    else if ( profession == JOURNEYMAN_MYSTIC ) { return @"JourneymanMystic"; }
    else if ( profession == MYSTIC ) { return @"Mystic"; }
    else { return @"Exile"; }
    
}

/**
 Converts an image number from data source (Informer XML) to an NSImage.
 */
+(NSImage *)imageFromIdentifier:(NSUInteger)identifier
{
    
    if ( identifier == FEMALE_DWARF_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleDwarf0.png"]]; }
    else if ( identifier == FEMALE_DWARF_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleDwarf1.png"]]; }
    else if ( identifier == FEMALE_DWARF_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleDwarf2.png"]]; }
    else if ( identifier == FEMALE_FEN_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleFen0.png"]]; }
    else if ( identifier == FEMALE_FEN_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleFen1.png"]]; }
    else if ( identifier == FEMALE_FEN_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleFen2.png"]]; }
    else if ( identifier == FEMALE_FEN_3 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleFen3.png"]]; }
    else if ( identifier == FEMALE_FEN_4 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleFen4.png"]]; }
    else if ( identifier == FEMALE_HALFLING_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHalfling0.png"]]; }
    else if ( identifier == FEMALE_HALFLING_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHalfling1.png"]]; }
    else if ( identifier == FEMALE_HALFLING_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHalfling2.png"]]; }
    else if ( identifier == FEMALE_HUMAN_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHuman0.png"]]; }
    else if ( identifier == FEMALE_HUMAN_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHuman1.png"]]; }
    else if ( identifier == FEMALE_HUMAN_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHuman2.png"]]; }
    else if ( identifier == FEMALE_HUMAN_3 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleHuman3.png"]]; }
    else if ( identifier == FEMALE_SYLVAN_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleSylvan0.png"]]; }
    else if ( identifier == FEMALE_SYLVAN_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleSylvan1.png"]]; }
    else if ( identifier == FEMALE_THOOM_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleThoom0.png"]]; }
    else if ( identifier == FEMALE_THOOM_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleThoom1.png"]]; }
    else if ( identifier == FEMALE_THOOM_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleThoom2.png"]]; }
    else if ( identifier == FEMALE_UNDISCLOSED_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleUndisclosed0.png"]]; }
    else if ( identifier == FEMALE_UNDISCLOSED_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleUndisclosed1.png"]]; }
    else if ( identifier == FEMALE_UNDISCLOSED_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleUndisclosed2.png"]]; }
    else if ( identifier == FEMALE_ZO_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleZo0.png"]]; }
    else if ( identifier == FEMALE_ZO_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleZo1.png"]]; }
    else if ( identifier == FEMALE_ZO_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleZo2.png"]]; }
    else if ( identifier == MALE_DWARF_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleDwarf0.png"]]; }
    else if ( identifier == MALE_DWARF_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleDwarf1.png"]]; }
    else if ( identifier == MALE_DWARF_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleDwarf2.png"]]; }
    else if ( identifier == MALE_FEN_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleFen0.png"]]; }
    else if ( identifier == MALE_FEN_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleFen1.png"]]; }
    else if ( identifier == MALE_FEN_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleFen2.png"]]; }
    else if ( identifier == MALE_FEN_3 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleFen2.png"]]; }
    else if ( identifier == MALE_HALFLING_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHalfling0.png"]]; }
    else if ( identifier == MALE_HALFLING_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHalfling1.png"]]; }
    else if ( identifier == MALE_HALFLING_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHalfling2.png"]]; }
    else if ( identifier == MALE_HUMAN_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHuman0.png"]]; }
    else if ( identifier == MALE_HUMAN_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHuman1.png"]]; }
    else if ( identifier == MALE_HUMAN_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHuman2.png"]]; }
    else if ( identifier == MALE_HUMAN_3 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleHuman3.png"]]; }
    else if ( identifier == MALE_SYLVAN_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleSylvan0.png"]]; }
    else if ( identifier == MALE_SYLVAN_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleSylvan1.png"]]; }
    else if ( identifier == MALE_THOOM_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleThoom0.png"]]; }
    else if ( identifier == MALE_THOOM_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleThoom1.png"]]; }
    else if ( identifier == MALE_THOOM_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleThoom2.png"]]; }
    else if ( identifier == MALE_UNDISCLOSED_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleUndisclosed0.png"]]; }
    else if ( identifier == MALE_UNDISCLOSED_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleUndisclosed1.png"]]; }
    else if ( identifier == MALE_ZO_0 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleZo0.png"]]; }
    else if ( identifier == MALE_ZO_1 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleZo1.png"]]; }
    else if ( identifier == MALE_ZO_2 ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"maleZo2.png"]]; }
    else if ( identifier == TALAS ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"talas.png"]]; }
    else if ( identifier == EXINFERIS ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"exinferis.png"]]; }
    else { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"femaleUndisclosed0.png"]]; }
    
}

/**
 Returns image representation for integer representation of a profession
 */
+(NSImage *)imageForProfession:(NSUInteger)profession
{
    
    if ( profession == FIGHTER ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"fighter.png"]]; }
    else if ( profession == RANGER ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"ranger.png"]]; }
    else if ( profession == CHAMPION ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"champion.png"]]; }
    else if ( profession == BLOODMAGE ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"bloodmage.png"]]; }
    else if ( profession == HEALER ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"healer.png"]]; }
    else if ( profession == APPRENTICE_MYSTIC ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"apprenticeMystic.png"]]; }
    else if ( profession == JOURNEYMAN_MYSTIC ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"journeymanMystic.png"]]; }
    else if ( profession == MYSTIC ) { return [[NSImage alloc] initByReferencingFile:[NSBundle.mainBundle pathForImageResource:@"mystic.png"]]; }
    else { return nil; }
    
}


/**
 Gets all colors from the color palette containing the colors designated for a player sprite.
 */
+(NSDictionary *)colorPalette
{
    
    if ( !colorPalette )
    {
        
         colorPalette = [NSDictionary dictionaryWithObjectsAndKeys:
         [NSColor colorWithCalibratedRed:0.509803f green:0.509803f blue:0.509803f alpha:1.0f], @"Hair Color 1",
         [NSColor colorWithCalibratedRed:0.549019f green:0.549019f blue:0.549019f alpha:1.0f], @"Hair Color 2",
         [NSColor colorWithCalibratedRed:0.627450f green:0.627450f blue:0.627450f alpha:1.0f], @"Skin Dye Color 1",
         [NSColor colorWithCalibratedRed:0.666666f green:0.666666f blue:0.666666f alpha:1.0f], @"Skin Dye Color 2",
         [NSColor colorWithCalibratedRed:0.705882f green:0.705882f blue:0.705882f alpha:1.0f], @"Skin Dye Color 3",
         [NSColor colorWithCalibratedRed:0.588235f green:0.588235f blue:0.588235f alpha:1.0f], @"Shoe Color",
         [NSColor colorWithCalibratedRed:0.196078f green:0.196078f blue:0.196078f alpha:1.0f], @"Pants Color 1",
         [NSColor colorWithCalibratedRed:0.156863f green:0.156863f blue:0.156863f alpha:1.0f], @"Pants Color 2",
         [NSColor colorWithCalibratedRed:0.235294f green:0.235294f blue:0.235294f alpha:1.0f], @"Belt Color 1",
         [NSColor colorWithCalibratedRed:0.274510f green:0.274510f blue:0.274510f alpha:1.0f], @"Belt Color 2",
         [NSColor colorWithCalibratedRed:0.313725f green:0.313725f blue:0.313725f alpha:1.0f], @"Shirt Color 1",
         [NSColor colorWithCalibratedRed:0.352941f green:0.352941f blue:0.352941f alpha:1.0f], @"Shirt Color 2",
         [NSColor colorWithCalibratedRed:0.392157f green:0.392157f blue:0.392157f alpha:1.0f], @"Shirt Color 3",
         [NSColor colorWithCalibratedRed:0.470588f green:0.470588f blue:0.470588f alpha:1.0f], @"Weapon Color 1",
         [NSColor colorWithCalibratedRed:0.431373f green:0.431373f blue:0.431373f alpha:1.0f], @"Weapon Color 2",
         nil];
                
    }
    
    return colorPalette;
    
}

/**
 Gets all colors from the color table containing all possible colors.
 */
+(NSArray *)allColors
{
    
    if ( !allColors )
    {
        
        allColors = [NSArray arrayWithObjects:
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.8f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.8f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.8f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.8f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.8f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.8f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.6f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.6f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.6f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.6f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.6f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.6f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.4f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.4f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.4f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.4f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.4f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.4f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.2f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.2f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.2f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.2f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.2f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.2f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:1.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:1.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:1.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:1.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:1.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.6f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.6f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.6f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.6f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.6f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.6f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.4f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.4f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.4f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.4f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.4f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.4f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.2f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.2f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.2f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.2f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.2f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.2f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.8f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:1.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:1.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:1.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:1.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:1.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.8f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.8f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.8f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.8f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.8f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.8f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.6f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.6f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.6f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.6f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.6f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.6f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.4f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.4f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.4f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.4f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.4f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.4f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.2f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.2f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.2f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.2f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.2f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.2f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.6f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:1.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:1.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:1.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:1.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:1.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.8f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.8f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.8f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.8f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.8f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.8f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.6f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.6f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.6f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.6f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.6f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.6f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.4f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.4f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.4f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.4f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.4f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.4f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.2f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.2f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.2f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.2f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.2f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.2f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.4f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:1.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:1.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:1.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:1.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:1.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.8f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.8f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.8f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.8f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.8f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.8f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.6f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.6f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.6f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.6f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.6f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.6f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.4f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.4f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.4f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.4f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.4f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.4f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.2f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.2f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.2f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.2f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.2f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.2f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.2f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:1.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:1.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:1.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:1.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:1.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.8f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.8f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.8f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.8f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.8f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.8f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.6f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.6f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.6f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.6f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.6f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.6f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.4f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.4f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.4f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.4f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.4f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.4f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.2f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.2f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.2f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.2f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.2f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.2f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.8f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.6f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.4f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.2f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.933333f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.866667f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.733333f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.666667f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.533333f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.466667f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.333333f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.266667f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.133333f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.066667f green:0.0f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.933333f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.866667f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.733333f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.666667f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.533333f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.466667f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.333333f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.266667f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.133333f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.066667f blue:0.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.933333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.866667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.733333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.666667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.533333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.466667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.333333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.266667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.133333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:1.0f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.933333f green:0.933333f blue:0.933333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.866667f green:0.866667f blue:0.866667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.733333f green:0.733333f blue:0.733333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.666667f green:0.666667f blue:0.666667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.533333f green:0.533333f blue:0.533333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.466667f green:0.466667f blue:0.466667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.333333f green:0.333333f blue:0.333333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.266667f green:0.266667f blue:0.266667f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.133333f green:0.133333f blue:0.133333f alpha:1.0f],
         [NSColor colorWithCalibratedRed:0.066667f green:0.066667f blue:0.066667f alpha:1.0f], nil];
        
    }
    
    return allColors;
    
}

/**
 Gets the string representation of a color from the color palette designated for player sprites.
 */
+(NSString *)nameForColorFromPalette:(NSColor *)color
{
    
    for ( NSColor *paletteColor in Constants.colorPalette.allValues )
    {
        
        if ( [paletteColor isEqualToColor:color] )
        {
            
            return [[Constants.colorPalette allKeysForObject:paletteColor] objectAtIndex:0];
        
        }
        
    }
    
    return nil;
    
}

/**
 Gets an NSColor representation of a color from the palette designated for player sprites through a String representation.
 */
+(NSColor *)colorFromPaletteForKey:(NSString *)key
{
    
    return [Constants.colorPalette objectForKey:key];

}

/**
 Gets a color from the color table containing all colors based on an index.
 */
+(NSColor *)colorFromAllColorsAtIndex:(NSUInteger)index
{
    
    return [Constants.allColors objectAtIndex:index];
    
}

@end
