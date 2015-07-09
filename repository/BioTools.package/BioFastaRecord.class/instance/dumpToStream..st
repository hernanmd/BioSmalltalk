accessing
dumpToStream: aStream
	" Private - Write the receiver's contents into aStream "
	
	aStream
		lineEndConvention: BioObject lineEndConvention;
		nextPut: $>;
		nextPutAll: self sequenceName;
		cr;
		nextPutAll: self sequenceString;
		cr