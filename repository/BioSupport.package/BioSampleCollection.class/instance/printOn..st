printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self size
		between: $[ -> $]