printing
printOn: aStream
	" Private - See superimplementor's comment "

	aStream
		nextPutAll: self name
		between: $[ and: $]