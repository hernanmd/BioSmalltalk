accessing
messageText

	^ String streamContents: [ :stream |
		messageText ifNotNil: [ stream nextPutAll: messageText; space ].
		stream nextPutAll: ' not found' translated ]