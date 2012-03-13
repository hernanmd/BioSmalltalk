accessing
writeOn: aStream
	" Write the receiver's data into aStream "
	
	super writeOn: aStream.
	aStream 
		nextPutAll: self sequenceString;
		cr