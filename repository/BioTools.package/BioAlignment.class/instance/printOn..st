printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	set do: [ : seq |
		aStream 
			cr;
			nextPutAll: seq asString ]