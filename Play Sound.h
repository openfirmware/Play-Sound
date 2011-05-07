//
//  Play Sound.h
//  Play Sound
//
//  Created by James Badger on 27/10/05.
//  Copyright 2011 James Badger. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>
#import <QTKit/QTKit.h>

@interface Play_Sound : AMBundleAction 
{
	bool		exitNow;
	bool		movieRunning;
	NSSound		*file;
	QTMovie*	movie;
}

- (bool)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;
- (void)movieDidEnd:(NSNotification *)aNotification;
- (void)stop;
@end
