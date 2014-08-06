//
//  CLAnnouncement.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLAnnouncement : NSObject

-(BOOL)isColiseumMessage;

@property NSUInteger type;
@property (strong) NSDate *time;
@property (strong) NSString *messenger;
@property (strong) NSString *message;
@property (strong) NSString *awardee;
@property (nonatomic, strong) NSImage *image;

@end
