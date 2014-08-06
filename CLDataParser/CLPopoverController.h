//
//  CLPopoverController.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLDataSource.h"

@interface CLPopoverController : NSViewController

@property (weak) IBOutlet NSPopover *popover;
@property NSInteger previousRow;

@property (weak) IBOutlet CLDataSource *dataSource;

@property (weak) IBOutlet NSTableView *table;
@property (weak) IBOutlet NSButton *name;
@property (weak) IBOutlet NSButton *clan;
@property (weak) IBOutlet NSButton *playTime;
@property (weak) IBOutlet NSButton *image;
@property (weak) IBOutlet NSButton *professionIcon;
@property (weak) IBOutlet NSButton *VIPButton;

- (IBAction)listNameClicked:(id)sender;
- (IBAction)professionIconClicked:(id)sender;
- (IBAction)buttonClicked:(id)sender;
- (IBAction)vipButtonPressed:(id)sender;

@end
