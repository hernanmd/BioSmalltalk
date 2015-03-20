printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPut: $[;
		nextPutAll: parser asString;
		nextPutAll: ' on: ';
		nextPutFirst: expression asString between: $" -> $";
		nextPutAll: ' results: ';
		nextPutAll: results asString;
		nextPut: $]