//
//  CLPreferencesWindowController.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Dylan Foster. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLNotificationsDelegate.h"
#import "CLMainWindowController.h"

@interface CLPreferencesWindowController : NSWindowController <NSWindowDelegate>

@property (strong) IBOutlet NSView *generalView;
@property (strong) IBOutlet NSView *notificationsView;
@property (strong) IBOutlet NSView *VIPView;

@property (weak) IBOutlet NSTableView *vipTable;
@property (weak) IBOutlet NSTextField *nameField;

@property (weak) IBOutlet NSColorWell *colorWell;

@property (weak) CLNotificationsDelegate *growlDelegate;
@property (strong) CLMainWindowController *mainWindowController;

- (IBAction)checkBoxToggled:(id)sender;

- (IBAction)generalButtonPressed:(id)sender;
- (IBAction)notificationsButtonPressed:(id)sender;
- (IBAction)VIPbuttonPressed:(id)sender;

- (IBAction)addVIP:(id)sender;
- (IBAction)removeVIP:(id)sender;

- (IBAction)viewPreferenceChanged:(id)sender;

@end
