//
//  Play Sound.m
//  Play Sound
//
//  Created by James Badger on 27/10/05.
//  Copyright 2011 James Badger. All rights reserved.
//

#import "Play Sound.h"


@implementation Play_Sound

- (bool)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
	NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
	
	NSEnumerator* inputRunner = [input objectEnumerator];
	id obj;
	
	exitNow = FALSE;
	while(obj = [inputRunner nextObject]) {
		movie = [[QTMovie alloc] initWithFile:obj error:nil];
		
		[notificationCenter addObserver:self selector:@selector(movieDidEnd:) name:QTMovieDidEndNotification object:movie];
		movieRunning = TRUE;
		[movie play];
		
		while (movieRunning && !exitNow)
			usleep(50);
			
		if(exitNow)
			[movie stop];
		
		[notificationCenter removeObserver:self name:QTMovieDidEndNotification object:movie];
		[movie dealloc];
	}
	return FALSE;
}

- (void)movieDidEnd:(NSNotification *)aNotification
{
	movieRunning = FALSE;
}

- (void)stop
{
	exitNow = TRUE;
}

@end
