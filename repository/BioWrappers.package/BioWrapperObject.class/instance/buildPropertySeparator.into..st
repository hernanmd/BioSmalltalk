accessing - private
buildPropertySeparator: assoc into: stream
	assoc key size = 1
		ifTrue: [ stream nextPut: $- ]
		ifFalse: [ stream nextPutAll: '--' ]