accessing private
buildProperties: stream

	self properties
		ifNotNil: [ 
			self properties associationsDo: [: assoc |
				stream space.
				assoc key size = 1
					ifTrue: [ stream nextPut: $- ]
					ifFalse: [ stream nextPutAll: '--' ].
				stream
					nextPutAll: assoc key;
					nextPut: $=;
					nextPutAll: assoc value ] ]