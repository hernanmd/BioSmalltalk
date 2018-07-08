printing
printOn: aStream
	" See superimplementor's comment "
	
	aStream 
		nextPutAll: self codes asString between: $[ and: $]