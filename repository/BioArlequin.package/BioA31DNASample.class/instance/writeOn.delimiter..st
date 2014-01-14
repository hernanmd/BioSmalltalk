accessing
writeOn: aStream delimiter: aDelimiterCharacter
	" Write the receiver's data into aStream "

	super writeOn: aStream delimiter: aDelimiterCharacter.
	self sequenceString
		do: [ :letter | 
			aStream
				nextPut: letter;
				nextPut: aDelimiterCharacter ].
	aStream nextPutAll: GRPlatform current newline