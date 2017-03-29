printing
printOn: aStream

	super printOn: aStream.
	aStream
		space;
		nextPutAll: self position asString between: ${ and: $};
		nextPutAll: self average asString between: $( and: $)