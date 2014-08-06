//
//  CLBugReportWindowController.h
//  Clanning
//
//  Created by Dylan Foster on 6/16/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CLBugReportWindowController : NSWindowController

@property (weak) IBOutlet NSTextField *reportText;
@property (weak) IBOutlet NSButton *submitButton;

@property (strong) IBOutlet NSView *thankYouView;
@property (weak) IBOutlet NSView *mainView;

- (IBAction)submit:(id)sender;

@end
