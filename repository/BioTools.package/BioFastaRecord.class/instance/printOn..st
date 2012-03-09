printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		space;
		nextPut: $>;
		nextPutAll: self name.