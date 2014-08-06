//
//  NSUserDefaults+CLColorUtilities.h
//  Clanning
//
//  Created by Emma on 12/30/12.
//
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (CLColorUtilities)

- (void)setColor:(NSColor *)aColor forKey:(NSString *)aKey;
- (NSColor *)colorForKey:(NSString *)aKey;

@end
