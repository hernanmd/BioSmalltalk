printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	contents
		ifNotNil: [ 
			aStream 
				space;
				nextPutFirst: contents between: $[ -> $] ]