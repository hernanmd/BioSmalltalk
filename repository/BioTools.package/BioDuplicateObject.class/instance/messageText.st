printing
messageText

	^ String streamContents: [ :stream |
		messageText ifNotNil: [ stream nextPutAll: messageText; space ].
		stream nextPutAll: ' already exists' translated ]