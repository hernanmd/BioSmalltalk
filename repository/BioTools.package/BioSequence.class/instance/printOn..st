printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	seq ifNotNil: [
		aStream
			nextPutAll: self size asString between: $( and: $);
			space;
			nextPutAll: self alphabet asString between: $( and: $);
			space;
			nextPutAll: seq asString between: $[  and: $] ]