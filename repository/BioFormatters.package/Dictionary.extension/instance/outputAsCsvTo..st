*BioFormatters
outputAsCsvTo: aStream
	" Write the receiver contents in the following CSV format:
	
	key1,value1;
	key2,value2;
	...
	 "

	self associationsDo: [: assoc |
		aStream
			nextPutAll: assoc key asString;
			nextPut: $;;
			nextPutAll: assoc value asString;
			cr ]