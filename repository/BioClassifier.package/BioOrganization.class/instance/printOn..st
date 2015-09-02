printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: 'Class:';
		nextPutAll: self name;
		space;
		nextPutAll: 'Matches: ';
		nextPutAll: self classifications size asString;
		space;
		nextPutAll: self feature asString 
		between: $[ and: $];
		cr