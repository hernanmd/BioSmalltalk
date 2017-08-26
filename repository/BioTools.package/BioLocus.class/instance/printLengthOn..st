printing
printLengthOn: aStream
	length notNil
		ifTrue: [ aStream
				space;
				nextPutAll: self length asString ]