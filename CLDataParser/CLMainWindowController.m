//
//  CLMainWindowController.m
//  Clanning
//
//  Created by Dylan Foster on 7/25/12.
//  Copyright (c) 2012 Dylan Foster. All rights reserved.
//

#import "CLMainWindowController.h"
#import "CLDataSource.h"


@interface CLMainWindowController()

@property (weak) NSTableView *table;

@end

@implementation CLMainWindowController

@synthesize originalTable = _originalTable;
@synthesize iClanView = _iClanView;
@synthesize iClanTable = _iClanTable;
@synthesize noConnectionView = _noConnectionView;
@synthesize originalView = _originalView;
@synthesize table = _table;

- (void)windowDidLoad
{
    
    [super windowDidLoad];
    
}

-(void)update
{
    
    [self.table.dataSource tableView:self.table sortDescriptorsDidChange:self.table.sortDescriptors];
        
}

-(void)displayProperTableWithResize:(BOOL)shouldResize
{
    
    //Window is iClan view
    if ( [[NSUserDefaults.standardUserDefaults stringForKey:@"viewType"] isEqualToString:@"iClan"] )
    {
        
        [self.table.dataSource tableView:self.table sortDescriptorsDidChange:_originalTable.sortDescriptors];
        [self.window setContentView:_iClanView];
        self.table = _iClanTable;
        
        if ( shouldResize)
        {
            
            NSRect windowFrame = self.window.frame;
            
            windowFrame.size.width = 485;
            windowFrame.size.height = 250;
            
            [self.window setFrame:windowFrame display:YES animate:YES];
            
        }
        
    }
    else
    {
        
        [self.table.dataSource tableView:self.table sortDescriptorsDidChange:_iClanTable.sortDescriptors];
        [self.window setContentView:_originalView];
        self.table = _originalTable;
        
        if ( shouldResize )
        {
            
            NSRect windowFrame = self.window.frame;
            
            windowFrame.size.width = 210;
            windowFrame.size.height = 399;
            
            [self.window setFrame:windowFrame display:YES animate:YES];
            
        }
        
    }
    
}

-(void)displayNoConnectionView
{
    
    [self.window setContentView:self.noConnectionView];
    self.table = nil;
    
}

@end
