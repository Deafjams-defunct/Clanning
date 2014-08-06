//
//  CLPreferencesWindowController.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Dylan Foster. All rights reserved.
//

#import "CLPreferencesWindowController.h"
#import "CLVIPDataSource.h"
#import "Constants.h"

@interface CLPreferencesWindowController()

-(void)sheetEnded;

@end

@implementation CLPreferencesWindowController
@synthesize generalView;
@synthesize notificationsView;
@synthesize VIPView = _VIPView;
@synthesize vipTable = _vipTable;
@synthesize nameField = _nameField;
@synthesize growlDelegate = _growlDelegate;
@synthesize mainWindowController = _mainWindowController;
@synthesize colorWell = _colorWell;

- (void)windowDidLoad
{
    
    [super windowDidLoad];
    
    [self.window setDelegate:self];

    [self.window setContentView:generalView];
    
    self.vipTable.dataSource = [CLVIPDataSource sharedVIPDataSource];
    self.vipTable.delegate = [CLVIPDataSource sharedVIPDataSource];
    
    [self.vipTable reloadData];
    
}
	
/**
 Saves selection of original or compact view.
 */
- (IBAction)viewPreferenceChanged:(id)sender
{
    
    //Set preference
    if ( [[sender identifier] isEqualToString:@"clanInOriginalView"] )
    {
        
        [NSUserDefaults.standardUserDefaults setBool:([sender state] == 1 ? YES : NO) forKey:@"clanInOriginalView"];
        
    }
    else
    {
        
        [NSUserDefaults.standardUserDefaults setValue:[sender title] forKey:@"viewType"];
        
    }
    
    //Update view
    [self.mainWindowController displayProperTableWithResize:YES];
    [self.mainWindowController update];
    
}

/**
 Displays a notification giving example notification when sticky checkbox is toggled
 */
- (IBAction)checkBoxToggled:(id)sender
{
    
    //Display sticky notification
    if ( [sender state] == NSOnState ) { [self.growlDelegate displayStickyExampleNotification]; }
    //Display non-sticky notification
    else { [self.growlDelegate displayNonStickyExampleNotification]; }
    
}

/**
 Window view shifts to general tab
 */
- (IBAction)generalButtonPressed:(id)sender
{
    
    [self.window setContentView:generalView];
    
    NSRect rect = self.window.frame;
    
    rect.origin.y += rect.size.height - 150;
    
    rect.size.width = 240;
    rect.size.height = 150;
    
    [self.window setFrame:rect display:YES animate:YES];

}

/**
 Window shifts to notifications tab
 */
- (IBAction)notificationsButtonPressed:(id)sender
{
    
    [self.window setContentView:notificationsView];
    
    NSRect rect = self.window.frame;
    
    rect.origin.y += rect.size.height - 389;
    
    rect.size.width = 431;
    rect.size.height = 389;
    
    [self.window setFrame:rect display:YES animate:YES];
            
}

- (IBAction)VIPbuttonPressed:(id)sender
{
    
    [self.window setContentView:_VIPView];
    
    NSRect rect = self.window.frame;
    
    rect.origin.y += rect.size.height - 336;
    
    rect.size.width = 317;
    rect.size.height = 336;
    
    [self.window setFrame:rect display:YES animate:YES];
    
    [self.vipTable reloadData];

}

-(void)sheetEnded
{
    
    [self.vipTable reloadData];
    
}

- (void)addVIP:(id)sender
{
    
    [CLVIPDataSource.sharedVIPDataSource addVIP:self.nameField.stringValue];
    self.nameField.stringValue = @"";
    
    [self.vipTable reloadData];
    
}

- (void)removeVIP:(id)sender
{
    
    [[CLVIPDataSource sharedVIPDataSource] removeVIP:[CLVIPDataSource.sharedVIPDataSource VIPAtRow:(NSUInteger)self.vipTable.selectedRow]];
    [self.vipTable reloadData];
    
}


@end
