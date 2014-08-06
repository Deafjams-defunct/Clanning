//
//  CLFeatureRequestWindowController.h
//  Clanning
//
//  Created by Dylan Foster on 6/16/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CLFeatureRequestWindowController : NSWindowController

@property (weak) IBOutlet NSTextField *featureText;
@property (weak) IBOutlet NSButton *submitButton;
@property (strong) IBOutlet NSView *thankYouView;
@property (weak) IBOutlet NSView *mainView;

- (IBAction)submit:(id)sender;

@end
