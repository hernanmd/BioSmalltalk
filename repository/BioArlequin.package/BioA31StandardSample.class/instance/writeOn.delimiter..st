accessing
writeOn: aStream delimiter: aDelimiterCharacter
	" Write the receiver's data into aStream "
	
	super writeOn: aStream.
	self matrices do: [: matrix |
		aStream 
			nextPutAll: matrix;
			cr ]
