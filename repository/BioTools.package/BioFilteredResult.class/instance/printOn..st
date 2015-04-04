printing
printOn: aStream
	" Private - Print the receiver's name and result size "
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: self size asString between: $[ -> $]