accessing
signalAlignmentNotFound: accessionString
	" Private - Signal an exception "
	
	| messageText |
	
	messageText := String streamContents: [: stream |
		stream
			nextPutAll: 'Alignment not found ' translated;
			space;
			nextPutAll: accessionString ].
	self signalNotFound: messageText