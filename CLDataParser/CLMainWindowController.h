//
//  CLMainWindowController.h
//  Clanning
//
//  Created by Dylan Foster on 7/25/12.
//  Copyright (c) 2012 Dylan Foster. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLDataSource.h"

@interface CLMainWindowController : NSWindowController

@property (strong) IBOutlet NSView *originalView;
@property (weak) IBOutlet NSTableView *originalTable;
@property (weak) IBOutlet NSView *iClanView;
@property (weak) IBOutlet NSTableView *iClanTable;
@property (weak) IBOutlet NSView *noConnectionView;


-(void)update;
-(void)displayProperTableWithResize:(BOOL)shouldResize;
-(void)displayNoConnectionView;

@end
