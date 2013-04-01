accessing
outputTo: aStream
	" Private - Write the receiver's contents into aStream "
	
	aStream
		lineEndConvention: BioObject lineEndConvention;
		nextPut: $>;
		nextPutAll: self sequenceNameWithoutDelimiter;
		cr;
		nextPutAll: self sequenceString;
		cr