//
//  CLPlayerWithImageAndClanViewCell.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLPlayerWithImageAndClanViewCell.h"

@implementation CLPlayerWithImageAndClanViewCell

@synthesize clanName = _clanName;

-(id)initWithViewCell:(CLPlayerWithImageViewCell *)view;
{
    
    if ( self = [super init] )
    {
        
        self.name = view.name;
        self.image = view.image;
        self.professionImage = view.professionImage;
        
    }
    
    return self;
    
}

@end
