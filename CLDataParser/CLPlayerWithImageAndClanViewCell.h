//
//  CLPlayerWithImageAndClanViewCell.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLPlayerWithImageViewCell.h"

@interface CLPlayerWithImageAndClanViewCell : CLPlayerWithImageViewCell

@property (weak) IBOutlet NSTextField *clanName;

-(id)initWithViewCell:(CLPlayerWithImageViewCell *)view;


@end
