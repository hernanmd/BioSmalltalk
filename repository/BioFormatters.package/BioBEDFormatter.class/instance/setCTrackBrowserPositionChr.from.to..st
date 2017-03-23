accessing - custom track browser
setCTrackBrowserPositionChr: chrString from: startPos to: endPos
	" Add a description for custom tracks "

	| chrRange |
	
	chrRange := String streamContents: [ : chrStream |
		chrStream
			nextPutAll: chrString;
			nextPut: $:;
			nextPutAll: startPos asString;
			nextPut: $-;
			nextPutAll: endPos asString ].
	self browser
		propertyAt: 'browser position';
		put: chrRange