//
//  CLTableCellView.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CLPlayerWithImageViewCell : NSView

@property (weak) IBOutlet NSImageView *image;
@property (weak) IBOutlet NSTextField *name;
@property (weak) IBOutlet NSImageView *professionImage;

@end
