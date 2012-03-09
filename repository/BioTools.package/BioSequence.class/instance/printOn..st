printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	seq ifNotNil: [
		aStream
			nextPutAll: self size asString between: $( -> $);
			space;
			nextPutAll: self alphabet asString between: $( -> $);
			space;
			nextPutAll: seq asString between: $[ -> $] ]