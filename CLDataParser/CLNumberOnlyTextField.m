//
//  CLNumberOnlyTextField.m
//  Clanning
//
//  Created by Emma on 12/28/12.
//
//

#import "CLNumberOnlyTextField.h"

@implementation CLNumberOnlyTextField

-(void) textDidEndEditing:(NSNotification *)aNotification {
	// replace content with its intValue ( or process the input's value differently )
	[self setIntValue:[self intValue]];
	// make sure the notification is sent back to any delegate
	//[[self delegate] controlTextDidEndEditing:aNotification];
}

@end
