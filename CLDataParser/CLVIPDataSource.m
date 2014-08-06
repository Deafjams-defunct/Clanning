//
//  CLVIPDataSource.m
//  Clanning
//
//  Created by Dylan Foster on 8/16/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLVIPDataSource.h"

@interface CLVIPDataSource()

@property (nonatomic, strong) NSMutableArray *VIPs;
@property (nonatomic, weak) NSTableView *currentTable;

@end

@implementation CLVIPDataSource

static CLVIPDataSource *sharedVIPDataSource;

+(void)initialize
{
    
    static BOOL initialized = NO;
    if(!initialized)
    {
        
        initialized = YES;
        sharedVIPDataSource = [[CLVIPDataSource alloc] init];
        
    }
    
}

+(CLVIPDataSource *)sharedVIPDataSource
{
    
    return sharedVIPDataSource;
    
}

@synthesize VIPs = _VIPs;
@synthesize currentTable = _currentTable;

- (id)init
{
    self = [super init];
    if (self)
    {
        
        _VIPs = [[NSUserDefaults.standardUserDefaults arrayForKey:@"storedVIPs"] mutableCopy];
        
    }
    return self;
}

-(NSMutableArray *)VIPs
{
    
    if ( !_VIPs ) { _VIPs = [[NSMutableArray alloc] init]; }
    return _VIPs;
    
}

-(void)save
{
    
    [NSUserDefaults.standardUserDefaults setObject:_VIPs forKey:@"storedVIPs"];
    
}

-(void)addVIP:(NSString *)VIP
{
    
    if ( ![_VIPs containsObject:VIP] )
    {
        
        [self.VIPs addObject:VIP];
        
        [_currentTable reloadData];
        
    }
    
}

-(void)removeVIP:(NSString *)VIP
{
    
    [self.VIPs removeObject:VIP];
    
    [_currentTable reloadData];
    
}

-(BOOL)contains:(NSString *)VIP
{
    
    return [self.VIPs containsObject:VIP];
    
}

-(NSString *)VIPAtRow:(NSUInteger)row
{
    
    if ( row > _VIPs.count ) { return nil; }
    
    return [_VIPs objectAtIndex:row];
    
}

-(NSString *)description
{
    
    return _VIPs.description;
    
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    
    return (NSInteger) self.VIPs.count;
    
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    
    _currentTable = tableView;
    
    return [_VIPs objectAtIndex:(NSUInteger)row];
    
}

@end
