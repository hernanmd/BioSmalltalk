printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream space.
	set do: [ : seq |
		aStream 
			cr;
			nextPutAll: seq asString ]