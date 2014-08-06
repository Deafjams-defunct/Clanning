//
//  AppDelegate.m
//  CLDataParser
//
//  Created by Emma Foster on 12/23/11.
//  Copyright (c) 2011 Emma Foster. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "CLBugReportWindowController.h"
#import "CLPreferencesWindowController.h"
#import "CLFeatureRequestWindowController.h"
#import "CLXMLParserDelegate.h"
#import "CLNotificationsDelegate.h"
#import "SystemConfiguration/SystemConfiguration.h"
#import "Reachability.h"
#import "CLDataDelegate.h"
#import "CLVIPDataSource.h"
#import "NSUserDefaults+CLColorUtilities.h"

@interface AppDelegate()

@property (nonatomic, strong) CLBugReportWindowController *bugReportWindowController;
@property (nonatomic, strong) CLFeatureRequestWindowController *featureRequestWindowController;
@property (nonatomic, strong) CLPreferencesWindowController *preferencesWindowController;
@property (nonatomic, strong) CLXMLParserDelegate *parserDelegate;
@property (nonatomic, strong) CLNotificationsDelegate *notificationsDelegate;
@property BOOL previouslyConnected;

-(void)refreshData;
-(BOOL)connected;

-(BOOL)preferencesArePresent;
-(void)setDefaultPreferences;
-(void)displayProperLaunchWindow;

-(void)showConnectedView;

@end

@implementation AppDelegate
@synthesize firstRunPanel = _firstRunPanel;
@synthesize window = _window;
@synthesize popoverController = _popoverController;
@synthesize dataSource = _dataSource;
@synthesize bugReportWindowController = _bugReportWindowController;
@synthesize featureRequestWindowController = _featureRequestWindowController;
@synthesize preferencesWindowController = _preferencesWindowController;
@synthesize parserDelegate = _parserDelegate;
@synthesize notificationsDelegate = _notificationsDelegate;
@synthesize previouslyConnected = _previouslyConnected;
@synthesize mainWindowController = _mainWindowController;

-(CLNotificationsDelegate *)notificationsDelegate
{
    
    if ( !_notificationsDelegate ) { _notificationsDelegate = [[CLNotificationsDelegate alloc] init]; }
    return _notificationsDelegate;
    
}

- (CLXMLParserDelegate *)parserDelegate
{
    
    if ( !_parserDelegate )
    { 
        
        _parserDelegate = [[CLXMLParserDelegate alloc] init];
        [self.parserDelegate setDataSource:self.dataSource];
    
    }
    return _parserDelegate;
    
}

- (CLBugReportWindowController *)bugReportWindowController
{
        
    if ( !_bugReportWindowController ) { _bugReportWindowController = [[CLBugReportWindowController alloc] initWithWindowNibName:@"CLBugReport"]; }
    return _bugReportWindowController;
    
}

- (CLFeatureRequestWindowController *)featureRequestWindowController
{
    
    if ( !_featureRequestWindowController ) { _featureRequestWindowController = [[CLFeatureRequestWindowController alloc] initWithWindowNibName:@"CLFeatureRequest"]; }
    return _featureRequestWindowController;
    
}

- (CLPreferencesWindowController *)preferencesWindowController
{
    
    if ( !_preferencesWindowController )
    {
                
        _preferencesWindowController = [[CLPreferencesWindowController alloc] initWithWindowNibName:@"Preferences"];
        _preferencesWindowController.mainWindowController = self.mainWindowController;
        _preferencesWindowController.growlDelegate = self.notificationsDelegate;
    
    }
    return _preferencesWindowController;
    
}

-(void)applicationWillTerminate:(NSNotification *)notification
{
    
    [CLVIPDataSource.sharedVIPDataSource save];
    
}

-(void)applicationWillBecomeActive:(NSNotification *)notification
{
    
    [_window makeKeyAndOrderFront:self];
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    //Clears preferences
    //[[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
    
    if ( ![self preferencesArePresent] ) { [self setDefaultPreferences]; }
    
    [self displayProperLaunchWindow];
    
    //Setting proper content view
    [self.mainWindowController displayProperTableWithResize:NO];
    
    //Setting window delegate
    [_window setDelegate:self];
    
    //Creating new thread for data updates
    NSThread *dataRefreshThread = [[NSThread alloc] initWithTarget: self
                                                          selector: @selector(refreshData)
                                                            object: self];
    [dataRefreshThread start];
    
}

/**
 Updates data from server, updates views.
 */
- (void)refreshData
{
    
    NSXMLParser *parser = nil;
    NSURL *dataURL = [NSURL URLWithString:@"http://www.deltatao.com/clanlord/status/cldata.xml"];
    
    BOOL firstRun = YES;
    
    while ( YES )
    {

        //Get new data
        
        parser = [[NSXMLParser alloc] initWithContentsOfURL:dataURL];
        [parser setDelegate:self.parserDelegate];
        
        if ( [self connected] )
        {
            
            [parser parse];
            parser = nil;
            
            //Update window title
            _window.title = [NSString stringWithFormat:@"%d Clanning", self.dataSource.population];
            
            //Tell MainWindowController to update data
            [self.mainWindowController update];
        
            if ( firstRun )
            {
                
                if ( [NSUserDefaults.standardUserDefaults boolForKey:@"logon"] )
                {
                                        
                    for ( CLPlayer *player in [self.dataSource getCurrentVIPs] ) { [self.notificationsDelegate playerBeginsClanning:player]; }
                    
                }
                
                
                //Send all status notifications sent within the previous hour
                if ( [NSUserDefaults.standardUserDefaults boolForKey:@"checkStatusesAtLaunch"] )
                {
                    
                    for ( CLAnnouncement *announcement in [self.dataSource getStatusAnnouncementsFromPreviousHour] ) { [self.notificationsDelegate notificationForAnnouncement:announcement]; }
                    
                }
                
                firstRun = NO;
                
            }
            else
            {
                
                [self showConnectedView];
                
            }
            
            _previouslyConnected = YES;
            
        }
        else
        {
            
            _window.title = @"Clanning";
            [self.mainWindowController displayNoConnectionView];
            
            _previouslyConnected = NO;
        
        }
        
        parser = nil;
        
        //Wait the refresh time of XML feed to get new data
        [NSThread sleepForTimeInterval:REFRESH_TIME];
        
    }
    
}

-(BOOL)preferencesArePresent
{
    
    return !([NSUserDefaults.standardUserDefaults stringForKey:@"notificationSetting"] == nil);
    
}

-(void)setDefaultPreferences
{
    
    [NSUserDefaults.standardUserDefaults setBool:NO forKey:@"onlyDisplayForVIPs"];
    [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"checkStatusesAtLaunch"];
    [NSUserDefaults.standardUserDefaults setColor:[NSColor colorWithCalibratedRed:0.4745098039f green:0.04705882353f blue:1.0f alpha:1.0f] forKey:@"vipColor"];
    [NSUserDefaults.standardUserDefaults setValue:[NSNumber numberWithInt:1] forKey:@"logon"];
    [NSUserDefaults.standardUserDefaults setValue:0 forKey:@"logoff"];
    [NSUserDefaults.standardUserDefaults setValue:[NSNumber numberWithInt:1] forKey:@"status"];
    [NSUserDefaults.standardUserDefaults setValue:[NSNumber numberWithInt:1] forKey:@"stickyStatus"];
    [NSUserDefaults.standardUserDefaults setValue:[NSNumber numberWithInt:1] forKey:@"congratulations"];
    [NSUserDefaults.standardUserDefaults setValue:0 forKey:@"koppi"];
    [NSUserDefaults.standardUserDefaults setValue:[NSNumber numberWithInt:30] forKey:@"koppiInterval"];
    [NSUserDefaults.standardUserDefaults setValue:0 forKey:@"crius"];
    [NSUserDefaults.standardUserDefaults setValue:[NSNumber numberWithInt:15] forKey:@"criusInterval"];
    [NSUserDefaults.standardUserDefaults setObject:nil forKey:@"storedVIPs"];

}

-(void)displayProperLaunchWindow
{
    
    //If this is the first launch, get a display window option from user
    if ( ![NSUserDefaults.standardUserDefaults stringForKey:@"firstLaunch"] ){ [_firstRunPanel makeKeyAndOrderFront:self]; }
    else if ( [[NSUserDefaults.standardUserDefaults stringForKey:@"firstLaunch"] isEqualToString:@"No"] ) { [_firstRunPanel makeKeyAndOrderFront:self]; }
    else
    {
        
        [_window makeKeyAndOrderFront:self];
        [self.mainWindowController displayProperTableWithResize:YES];
        
    }
    
}

-(void)showConnectedView
{
    
    if ( !_previouslyConnected )
    {
        
        [self.mainWindowController displayProperTableWithResize:NO];
        [self.mainWindowController update];
        
    }
    
}

-(BOOL)connected
{
    
    return !( [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable );
    
}

/**
 Menu help -> report a bug item clicked
 */
- (IBAction)bugReportClicked:(id)sender
{
            
    [self.bugReportWindowController showWindow:sender];
        
}

/**
 Menu help -> feature request item clicked
 */
- (IBAction)featureRequestClicked:(id)sender {
    
    [self.featureRequestWindowController showWindow:sender];
    
}

/**
 Menu help -> website item clicked
 */
- (IBAction)websiteClicked:(id)sender
{
    
    [NSWorkspace.sharedWorkspace openURL:[NSURL URLWithString:@"http://deafjams.com/clanning/"]];
    
}

- (IBAction)clanLordWebsiteClicked:(id)sender {
    
    [NSWorkspace.sharedWorkspace openURL:[NSURL URLWithString:@"http://www.clanlord.com/"]];
    
}

/**
 Sets table view preference
 */
- (IBAction)viewPreferenceSelected:(id)sender {
    
    [NSUserDefaults.standardUserDefaults setValue:[sender title] forKey:@"viewType"];
    
    [self tableViewSelected:sender];
    
    [NSUserDefaults.standardUserDefaults setValue:@"No - iClan View" forKey:@"firstLaunch"];
    
    [_firstRunPanel orderOut:self];
    [_window makeKeyAndOrderFront:self];
    
}

/**
 Preferences menu item clicked
 */
- (IBAction)openPreferences:(id)sender
{
    
    [self.preferencesWindowController showWindow:sender];
    
}

- (IBAction)tableViewSelected:(id)sender
{
    
    [self.preferencesWindowController viewPreferenceChanged:sender];
    
}

/**
 If window is placed into background, close popover and allow the popover to be displayed again.
 */
-(void)windowDidResignKey:(NSNotification *)notification
{
    
    [[self.popoverController popover] close];
    self.popoverController.previousRow = -1;
    
}

@end
