printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self name between: $( and: $);
		space;
		nextPutAll: 'Jobs: ';
		nextPutAll: self jobsCount asString