//
//  CLPopoverController.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLPopoverController.h"
#import "Constants.h"

@interface CLPopoverController()

@property BOOL displayPopover;
@property NSInteger currentRow;

@end

@implementation CLPopoverController
@synthesize popover = _popover;
@synthesize table = _table;
@synthesize name = _name;
@synthesize clan = _clan;
@synthesize playTime = _playTime;
@synthesize image = _image;
@synthesize professionIcon = _professionIcon;
@synthesize VIPButton = _VIPButton;
@synthesize previousRow = _previousRow;
@synthesize displayPopover = _displayPopover;
@synthesize dataSource = _dataSource;
@synthesize currentRow = _currentRow;

-(void)awakeFromNib
{
    
    _displayPopover = YES;
    
}

/**
 Displays popover for player
 */
- (IBAction)listNameClicked:(id)sender
{
    
    _currentRow = [_table selectedRow];
    
    if ( ( _currentRow != _previousRow || ( _currentRow == _previousRow && _displayPopover ) ) )
    {
        
        //Setting text of popover buttons
        _name.title = [_dataSource nameForRow:(NSUInteger)_currentRow];
        _clan.title = [_dataSource clanForRow:(NSUInteger)_currentRow];
        _playTime.title = [_dataSource clanningTimeForRow:(NSUInteger)_currentRow];
        
        //Setting popover images
        _image.image = [_dataSource imageForRow:(NSUInteger)_currentRow];
        _professionIcon.image = [Constants imageForProfession:(NSUInteger)[_dataSource professionForRow:(NSUInteger)_currentRow]];
        
        if ( [_dataSource playerAtRowIsVIP:(NSUInteger)_currentRow] ) { _VIPButton.state = NSOnState; }
        else { _VIPButton.state = NSOffState; }
        
        //Displaying popover
        [_popover showRelativeToRect: NSMakeRect(0, 0, 0, 0)
                              ofView: [sender rowViewAtRow:(NSInteger)_currentRow makeIfNecessary:YES]
                       preferredEdge: NSMaxXEdge];
        
    }
    else
    { 
        
        //If same row is clicked twice, close the popover.
        [_popover close];
        
    }
    
    //Set previous row to current row
    _displayPopover ^= YES;
    _previousRow = _currentRow;
     
}

/**
 One of the buttons on the popover was pressed, open proper website
 */
- (IBAction)buttonClicked:(id)sender
{
    
    NSMutableString* name;
    
    if ( [[sender identifier] isEqualToString:@"image"] ) { name = [_name.title mutableCopy]; }
    else { name = [[NSMutableString alloc] initWithString:[sender title]]; }
    
    //Cleaning up name
    [name replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0, name.length)];
    [name replaceOccurrencesOfString:@"'" withString:@"" options:0 range:NSMakeRange(0, name.length)];
    [name replaceOccurrencesOfString:@"&" withString:@"And" options:0 range:NSMakeRange(0, name.length)];
    
    [NSWorkspace.sharedWorkspace openURL:[NSURL URLWithString:[@"http://puddleopedia.org/entry.php?n=Entry." stringByAppendingString:name]]];
    
}

- (IBAction)vipButtonPressed:(id)sender
{
    
    if ( [sender state] == NSOffState )
    {
        
        [_dataSource playerForRow:_currentRow].isVIP = NO;
    
    }
    else
    {
        
        [_dataSource playerForRow:_currentRow].isVIP = YES;
            
    }
    
    [_table reloadDataForRowIndexes:[[NSIndexSet alloc] initWithIndex:(NSUInteger)_currentRow] columnIndexes:[[NSIndexSet alloc] initWithIndex:0]];
        
}

/**
 Profession picture was clicked, open proper website
 */
- (IBAction)professionIconClicked:(id)sender
{
    
    [NSWorkspace.sharedWorkspace openURL:[NSURL URLWithString:[@"http://puddleopedia.org/entry.php?n=Entry." stringByAppendingString:[Constants nameForProfession:(NSUInteger)[_dataSource professionForRow:(NSUInteger)_currentRow]]]]];
    
}

@end
