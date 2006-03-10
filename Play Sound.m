//
//  Play Sound.m
//  Play Sound
//
//  Created by James Badger on 27/10/05.
//  Copyright 2005 James Badger. All rights reserved.
//

#import "Play Sound.h"


@implementation Play_Sound

- (bool)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
	NSEnumerator *inputRunner = [input objectEnumerator];
	id obj;
	
	exitNow = FALSE;
	
	while(obj = [inputRunner nextObject]) {
		
		NSDictionary *inputAttributes = [[NSFileManager defaultManager] fileAttributesAtPath:obj traverseLink:YES];
		
		if(!exitNow && inputAttributes) {
			
			switch([inputAttributes fileHFSTypeCode]) {
				// First test file TYPES
				case 'AIFF':
				case 'M4A ':
				case 'MPEG':
				case '.WAV':
				case 'ULAW':
					file = [[NSSound alloc] initWithContentsOfFile:obj byReference:NO];
					
					[file play];
					
					while([file isPlaying]) {
						if(exitNow) {
							[file stop];
							break;
						}
					}
			
			break;
			default: // Else test file ending
				if(([[obj lowercaseString] rangeOfString:@".mp3"].length != 0) || ([[obj lowercaseString] rangeOfString:@".m4a"].length != 0) || ([[obj lowercaseString] rangeOfString:@".wav"].length != 0) || ([[obj lowercaseString] rangeOfString:@".au"].length != 0) || ([[obj lowercaseString] rangeOfString:@".aif"].length != 0)) {
						file = [[NSSound alloc] initWithContentsOfFile:obj byReference:NO];
		
						[file play];
		
						while([file isPlaying]) {
							if(exitNow) {
								[file stop];
								break;
							}
						} // end while
				} // end if 2
			} // end switch 1
		} // end if 1



	}	
bool answer = FALSE;

return answer;
}

- (void)stop
{
	exitNow = TRUE;
}

@end

/*if (!exitNow && inputAttributes && ([inputAttributes fileHFSTypeCode] == 'AIFF') || ([inputAttributes fileHFSTypeCode] == 'M4A ') || ([inputAttributes fileHFSTypeCode] == 'MPEG') || ([inputAttributes fileHFSTypeCode] == '.WAV') || ([[obj lowercaseString] rangeOfString:@".mp3"].length != 0)) {

file = [[NSSound alloc] initWithContentsOfFile:obj byReference:NO];

[file play];

while([file isPlaying]) {
				if(exitNow) {
					[file stop];
					break;
				}
}

}*/