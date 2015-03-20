printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self class name;
		space;
		nextPut: $(;
		nextPutAll: self contents greaseString;
		nextPut: $)

	