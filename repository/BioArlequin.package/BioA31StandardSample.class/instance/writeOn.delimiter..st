accessing
writeOn: aStream delimiter: aDelimiterCharacter
	" Write the receiver's data into aStream "

	self writeOn: aStream.
	self matrices
		do: [ :matrix | 
			aStream
				nextPutAll: matrix;
				nextPut: Character cr ]