accessing
append: aString
	" Append aString to the receiver's sequence "
	
	seq := String streamContents: [: str | 
		str 	nextPutAll: seq;
			nextPutAll: aString ]