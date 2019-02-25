printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPutAll: self id;
		nextPutAll: self chr asString between: $[ and: $];
		nextPutAll: self position asString between: $[ and: $]