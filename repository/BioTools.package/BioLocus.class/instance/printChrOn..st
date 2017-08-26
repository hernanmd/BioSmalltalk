printing
printChrOn: aStream
	chrLocation
		ifNil: [ aStream
				space;
				nextPutAll: 'chr: ?' between: $( and: $) ]
		ifNotNil: [ aStream
				space;
				nextPutAll: 'chr:';
				nextPutAll: chrLocation asString between: $( and: $) ]