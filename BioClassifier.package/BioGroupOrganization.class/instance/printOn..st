printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPut: $#;
		nextPutAll: self selector asString;
		space;
		nextPutAll: self strategy asString;
		cr.
	self contents printOn: aStream.