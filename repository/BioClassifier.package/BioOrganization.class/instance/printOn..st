printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: 'Matches: ';
		nextPutAll: self classifications size asString;
		space;
		nextPutAll: self feature asString 
		between: $[ -> $];
		cr