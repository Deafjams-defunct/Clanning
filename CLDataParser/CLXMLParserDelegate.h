//
//  CLXMLParserDelegate.h
//  Clanning
//
//  Created by Dylan Foster on 6/26/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLDataSource.h"

@interface CLXMLParserDelegate : NSObject <NSXMLParserDelegate>

@property (weak) CLDataSource *dataSource;

@end
