printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream
		nextPutAll: self motif between: $( and: $);
		nextPutAll: self repeats asString