printing
printRangeOn: stream

	(self start notNil and: [ self end notNil ])
		ifTrue: [ 
			stream
				space;
				nextPutAll: self start asString;
				nextPut: $-;
				nextPutAll: self end asString ]