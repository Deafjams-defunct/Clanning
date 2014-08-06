//
//  CLTableCellView.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLPlayerWithImageViewCell.h"

@implementation CLPlayerWithImageViewCell

@synthesize image;
@synthesize name;
@synthesize professionImage;

- (id)init
{
    self = [super init];
    if (self) {
        
        [self.name bind:@"textColor"
               toObject:NSUserDefaults.standardUserDefaults
            withKeyPath:@"vipColor"
                options:[NSDictionary dictionaryWithObject:NSUnarchiveFromDataTransformerName forKey:NSValueTransformerNameBindingOption]];
        
    }
    return self;
}


@end
