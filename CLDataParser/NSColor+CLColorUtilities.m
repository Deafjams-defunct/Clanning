//
//  NSColor+CLColorUtilities.m
//  
//
//  Created by Dylan Foster on 6/4/12.
//  Copyright (c) 2012 Finger Lakes Community College. All rights reserved.
//

#import "NSColor+CLColorUtilities.h"

@implementation NSColor (CLColorUtilities)

/**
 Checks equality of a color by comparing it's RGBA components
 */
-(BOOL)isEqualToColor:(NSColor *)color
{
    
    //Fast comparison of NSColors, fit for this app
    CGFloat firstComponents[4], secondComponents[4];
    
    //Gettinc components
    [self getComponents:firstComponents];
    [color getComponents:secondComponents];
    
    //Comparing float values of components
    for ( int i = 0; i < 4; i++ )
    {
                
        if ( fabs(firstComponents[i] - secondComponents[i]) > 0.000001 ) { return NO; }
                
    }
    
    return YES;
    
}

@end
