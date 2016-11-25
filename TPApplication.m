#import "TPApplication.h"

@implementation TPApplication

- (void)setEventDelegate:(id<TPEventDelegate>)eventDelegate
{
	_eventsDelegate = eventDelegate;
}

- (void)sendEvent:(NSEvent *)event
{
	BOOL sendToSuper = YES;
	
	DebugLog(@"sendEvent: %@ (%lu)", event, (unsigned long)[event type]);
	
	NSLog(@"TP Application send event");
	
	if(_eventsDelegate != nil && [_eventsDelegate respondsToSelector:@selector(applicationWillSendEvent:)]) {
		if(![_eventsDelegate applicationWillSendEvent:event])
			NSLog(@"wont send");
			sendToSuper = NO;
	}
	
	if(sendToSuper)
		[super sendEvent:event];
}

@end
