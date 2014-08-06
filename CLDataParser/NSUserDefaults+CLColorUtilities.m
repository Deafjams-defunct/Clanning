//
//  NSUserDefaults+CLColorUtilities.m
//  Clanning
//
//  Created by Emma on 12/30/12.
//
//

#import "NSUserDefaults+CLColorUtilities.h"

@implementation NSUserDefaults (CLColorUtilities)

- (void)setColor:(NSColor *)aColor forKey:(NSString *)aKey
{
    NSData *theData=[NSArchiver archivedDataWithRootObject:aColor];
    [self setObject:theData forKey:aKey];
}

- (NSColor *)colorForKey:(NSString *)aKey
{
    NSColor *theColor=nil;
    NSData *theData=[self dataForKey:aKey];
    if (theData != nil)
        theColor=(NSColor *)[NSUnarchiver unarchiveObjectWithData:theData];
    return theColor;
}

@end
