accessing
outputTo: aStream
	" Private - Write the receiver's contents into aStream "
	
	aStream
		nextPut: $>;
		nextPutAll: self sequenceName;
		bioCr;
		nextPutAll: self sequenceString