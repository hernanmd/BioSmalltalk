printing
messageText

	^ String streamContents: [ :strm |
		messageText ifNotNil: [ strm nextPutAll: messageText; space ].
		strm nextPutAll: ' not found' translated ]