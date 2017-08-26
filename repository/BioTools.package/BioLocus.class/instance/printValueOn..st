printing
printValueOn: aStream
	value notNil
		ifTrue: [ aStream
				space;
				nextPutAll: value asString ]