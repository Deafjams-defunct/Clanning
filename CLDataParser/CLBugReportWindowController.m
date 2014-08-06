//
//  CLBugReportWindowController.m
//  Clanning
//
//  Created by Dylan Foster on 6/16/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLBugReportWindowController.h"

@implementation CLBugReportWindowController

@synthesize reportText;
@synthesize submitButton;
@synthesize thankYouView;
@synthesize mainView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    [self.window setDefaultButtonCell:submitButton.cell];

}

- (IBAction)submit:(id)sender {
    
    //Makes NSURLRequest with properly formatted GET HTTP Request, with text from window's text field.
    
    NSString *urlString = [NSString stringWithFormat:@"http://deafjams.com/clanning/report.php?subject=Bug Report&message=%@", reportText.stringValue];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    //Submits to server
    [NSURLConnection sendAsynchronousRequest:request queue:nil completionHandler:nil];
    
    [self.window setContentView:thankYouView];
    [self.window display];
    
    [NSThread sleepForTimeInterval:1];
    
    [self close];
    
    [self.window setContentView:mainView];
    [reportText setStringValue:@""];
    
}

@end
