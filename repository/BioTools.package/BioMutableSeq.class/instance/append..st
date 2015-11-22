accessing
append: aString
	" This method modifies the receiver. Append aString to the receiver's sequence "
	
	seq := String streamContents: [ : str | 
		str
			nextPutAll: seq;
			nextPutAll: aString asString ]