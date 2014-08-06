//
//  Player.h
//  Clanning
//
//  Created by Dylan Foster on 12/24/11.
//  Copyright (c) 2011 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLPlayer : NSObject

@property (strong) NSDate *startTime;
@property (strong) NSString *clan;
@property (strong) NSString *name;
@property (strong) NSImage *image;
@property (strong) NSDictionary *colors;
@property NSInteger race;
@property NSInteger sex;
@property int profession;
@property (nonatomic) BOOL isVIP;

-(void)colorsWithArray:(NSArray *)colors;
-(NSString *)description;

@end
