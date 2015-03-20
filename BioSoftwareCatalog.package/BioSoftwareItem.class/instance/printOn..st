printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		nextPut: $[;
		nextPutAll: self softwareName;
		nextPut: $]