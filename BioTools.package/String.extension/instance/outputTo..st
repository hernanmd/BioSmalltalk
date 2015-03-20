*BioTools
outputTo: aStream
	" Private - Write the receiver's contents into aStream "

	aStream 
		nextPutAll: self;
		bioCr.