//
//  Constants.h
//  Clanning
//
//  Created by Dylan Foster on 5/15/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

+(NSString *)nameForColorFromPalette:(NSColor *)color;
+(NSColor *)colorFromPaletteForKey:(NSString *)key;
+(NSColor *)colorFromAllColorsAtIndex:(NSUInteger)index;
+(NSUInteger)announcmentTypeFromString:(NSString *)type;
+(NSUInteger)raceFromString:(NSString *)race;
+(NSUInteger)professionFromString:(NSString *)profession;
+(NSString *)nameForRace:(NSUInteger)race;
+(NSString *)nameForProfession:(NSUInteger)profession;
+(NSImage *)imageFromIdentifier:(NSUInteger)identifier;
+(NSImage *)imageForProfession:(NSUInteger)profession;

//Notification constants
extern NSUInteger const NONE;
extern NSUInteger const FEW;
extern NSUInteger const SOME;
extern NSUInteger const STANDARD;
extern NSUInteger const LOTS;
extern NSUInteger const ALL;
extern NSUInteger const CUSTOM;

//Announcement constants
extern NSUInteger const KOPPI;
extern NSUInteger const NPC;
extern NSUInteger const CONGRATS;
extern NSUInteger const ALERT;

//Profession constants
extern NSUInteger const FIGHTER;
extern NSUInteger const RANGER;
extern NSUInteger const CHAMPION;
extern NSUInteger const BLOODMAGE;
extern NSUInteger const HEALER;
extern NSUInteger const APPRENTICE_MYSTIC;
extern NSUInteger const JOURNEYMAN_MYSTIC;
extern NSUInteger const MYSTIC;
extern NSUInteger const EXILE;

//Race constants
extern NSUInteger const FEN;
extern NSUInteger const ZO;
extern NSUInteger const UNDISCLOSED;
extern NSUInteger const THOOM;
extern NSUInteger const SYLVAN;
extern NSUInteger const HUMAN;
extern NSUInteger const HALFLING;
extern NSUInteger const DWARF;

//Sex constants
extern NSUInteger const MALE;
extern NSUInteger const FEMALE;

//Server refresh time
extern NSUInteger const REFRESH_TIME;

//Image constants
extern NSUInteger const EXINFERIS;
extern NSUInteger const TALAS;
extern NSUInteger const FEMALE_DWARF_0;
extern NSUInteger const FEMALE_DWARF_1;
extern NSUInteger const FEMALE_DWARF_2;
extern NSUInteger const FEMALE_FEN_0;
extern NSUInteger const FEMALE_FEN_1;
extern NSUInteger const FEMALE_FEN_2;
extern NSUInteger const FEMALE_FEN_3;
extern NSUInteger const FEMALE_FEN_4;
extern NSUInteger const FEMALE_HALFLING_0;
extern NSUInteger const FEMALE_HALFLING_1;
extern NSUInteger const FEMALE_HALFLING_2;
extern NSUInteger const FEMALE_HUMAN_0;
extern NSUInteger const FEMALE_HUMAN_1;
extern NSUInteger const FEMALE_HUMAN_2;
extern NSUInteger const FEMALE_HUMAN_3;
extern NSUInteger const FEMALE_SYLVAN_0;
extern NSUInteger const FEMALE_SYLVAN_1;
extern NSUInteger const FEMALE_THOOM_0;
extern NSUInteger const FEMALE_THOOM_1;
extern NSUInteger const FEMALE_THOOM_2;
extern NSUInteger const FEMALE_UNDISCLOSED_0;
extern NSUInteger const FEMALE_UNDISCLOSED_1;
extern NSUInteger const FEMALE_UNDISCLOSED_2;
extern NSUInteger const FEMALE_ZO_0;
extern NSUInteger const FEMALE_ZO_1;
extern NSUInteger const FEMALE_ZO_2;
extern NSUInteger const MALE_DWARF_0;
extern NSUInteger const MALE_DWARF_1;
extern NSUInteger const MALE_DWARF_2;
extern NSUInteger const MALE_FEN_0;
extern NSUInteger const MALE_FEN_1;
extern NSUInteger const MALE_FEN_2;
extern NSUInteger const MALE_FEN_3;
extern NSUInteger const MALE_HALFLING_0;
extern NSUInteger const MALE_HALFLING_1;
extern NSUInteger const MALE_HALFLING_2;
extern NSUInteger const MALE_HUMAN_0;
extern NSUInteger const MALE_HUMAN_1;
extern NSUInteger const MALE_HUMAN_2;
extern NSUInteger const MALE_HUMAN_3;
extern NSUInteger const MALE_SYLVAN_0;
extern NSUInteger const MALE_SYLVAN_1;
extern NSUInteger const MALE_THOOM_0;
extern NSUInteger const MALE_THOOM_1;
extern NSUInteger const MALE_THOOM_2;
extern NSUInteger const MALE_UNDISCLOSED_0;
extern NSUInteger const MALE_UNDISCLOSED_1;
extern NSUInteger const MALE_ZO_0;
extern NSUInteger const MALE_ZO_1;
extern NSUInteger const MALE_ZO_2;

@end
