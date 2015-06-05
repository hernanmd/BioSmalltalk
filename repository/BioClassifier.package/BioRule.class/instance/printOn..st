printing
printOn: aStream

	super printOn: aStream.
	aStream
		space;
		nextPutAll: self names anyOne between: $[ -> $]
