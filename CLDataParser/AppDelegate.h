//
//  AppDelegate.h
//  CLDataParser
//
//  Created by Dylan Foster on 12/23/11.
//  Copyright (c) 2011 Dylan Foster. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLDataSource.h"
#import "CLPopoverController.h"
#import "CLMainWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSPanel *firstRunPanel;
@property (unsafe_unretained) IBOutlet CLPopoverController *popoverController;
@property (unsafe_unretained) IBOutlet CLDataSource *dataSource;

@property (strong) IBOutlet CLMainWindowController *mainWindowController;

- (IBAction)bugReportClicked:(id)sender;
- (IBAction)featureRequestClicked:(id)sender;
- (IBAction)websiteClicked:(id)sender;
- (IBAction)clanLordWebsiteClicked:(id)sender;
- (IBAction)viewPreferenceSelected:(id)sender;
- (IBAction)openPreferences:(id)sender;

- (IBAction)tableViewSelected:(id)sender;

@end
