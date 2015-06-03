accessing
writeOn: aStream
	" Write the receiver's data into aStream "

	aStream
		nextPutAll: self identifier;
		space;
		nextPutAll: self sequenceString;
		nextPutAll: GRPlatform current newline