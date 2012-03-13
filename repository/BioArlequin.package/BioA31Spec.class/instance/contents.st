accessing
contents
	" Answer a String with a suitable representation for 
	the receiver's input format "
	
	^ String streamContents: [ : str | 
		str nextPutAll: self notation asString;
			nextPut: $=;
			nextPutAll: self value asString ]