printing
printOn: aStream

	super printOn: aStream.
	aStream 
		space;
		nextPut: $[;
		nextPutAll: self identifier asString;
		nextPut: $];
		space;
		nextPut: $(;
		nextPutAll: self frequency asString;
		nextPut: $)