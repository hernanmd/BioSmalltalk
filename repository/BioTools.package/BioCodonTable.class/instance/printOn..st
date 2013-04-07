printing
printOn: aStream
	" Private - See superimplementor's comment "

	super printOn: aStream.
	aStream 
		space;
		nextPutAll: self tableId asString
		between: $[ -> $];
		space;
		nextPutAll: self alphaName.
