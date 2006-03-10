//
//  Play Sound.h
//  Play Sound
//
//  Created by James Badger on 27/10/05.
//  Copyright 2005 James Badger. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

@interface Play_Sound : AMBundleAction 
{
	bool		exitNow;
	NSSound		*file;
}

- (bool)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;
- (void)stop;
@end
