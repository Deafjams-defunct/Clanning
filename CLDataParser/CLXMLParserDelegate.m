//
//  CLXMLParserDelegate.m
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "CLXMLParserDelegate.h"
#import "CLPlayer.h"
#import "CLAnnouncement.h"
#import "CLVIPDataSource.h"
#import "Constants.h"

@interface CLXMLParserDelegate()

@property (strong) NSMutableString *currentElement;
@property (strong) CLPlayer *player;
@property (strong) CLAnnouncement *announcement;
@end

@implementation CLXMLParserDelegate

@synthesize dataSource = _dataSource;
@synthesize player = _player;
@synthesize announcement = _announcement;
@synthesize currentElement = _currentElement;

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    
    //Inform datasource that a new batch of data is incoming.
    [self.dataSource startingNewData];

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    //Create a new player object for exile in XML
    if ( [elementName isEqualToString:@"exile"] ){ _player = [[CLPlayer alloc] init]; }
    //Create a new announcement object for announcement in XML
    else if ( [elementName isEqualToString:@"announcement"] ) { _announcement = [[CLAnnouncement alloc] init]; }
    
    //Reset the current element
    _currentElement = nil;

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    //Working through an element. If the element does not exist, create it. If it does, append text to it.
    if ( !_currentElement ){ _currentElement = [[NSMutableString alloc] initWithString:string]; }
    else { [_currentElement appendString:string]; }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    //Population
    if ( [elementName isEqualToString:@"population"] ) { self.dataSource.population = _currentElement.intValue; }
    
    //Player
    else if ( [elementName isEqualToString:@"exile"] )
    {
        
        if( [CLVIPDataSource.sharedVIPDataSource contains:_player.name] || [CLVIPDataSource.sharedVIPDataSource contains:_player.clan] ) { _player.isVIP = YES; }
        
        [self.dataSource addPlayer:_player];
    
    }
    else if ( [elementName isEqualToString:@"name"] ) { _player.name = _currentElement; }
    else if ( [elementName isEqualToString:@"started"] ) { _player.startTime = [NSDate dateWithNaturalLanguageString:_currentElement]; }
    else if ( [elementName isEqualToString:@"clan"] ) { _player.clan = _currentElement; }
    else if ( [elementName isEqualToString:@"race"] ) { _player.race = (NSInteger)[Constants raceFromString:_currentElement]; }
    else if ( [elementName isEqualToString:@"picture"] ) { _player.image = [Constants imageFromIdentifier:(NSUInteger)_currentElement.intValue]; }
    else if ( [elementName isEqualToString:@"sex"] ) { _player.sex = [_currentElement isEqualToString:@"male"] ? (NSInteger) MALE : (NSInteger) FEMALE; }
    else if ( [elementName isEqualToString:@"colors"] ) { [_player colorsWithArray:[_currentElement componentsSeparatedByString:@" "]]; }
    else if ( [elementName isEqualToString:@"profession"] ) { _player.profession = (int)[Constants professionFromString:_currentElement]; }
    
    //Announcement
    else if ( [elementName isEqualToString:@"announcement"] ) { [self.dataSource addAnnouncement:_announcement]; }
    else if ( [elementName isEqualToString:@"type"] ) { _announcement.type = [Constants announcmentTypeFromString:_currentElement]; }
    else if ( [elementName isEqualToString:@"time"] ) { _announcement.time = [NSDate dateWithNaturalLanguageString:_currentElement]; }
    else if ( [elementName isEqualToString:@"messenger"] ) { _announcement.messenger = _currentElement; }
    else if ( [elementName isEqualToString:@"message"] ) { _announcement.message = _currentElement; }
    else if ( [elementName isEqualToString:@"awardee"] ) { _announcement.awardee = _currentElement; }
    
    _currentElement = nil;
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    //Inform datasource that the batch of data has ended.
    [self.dataSource endedNewData];
    
}

@end
