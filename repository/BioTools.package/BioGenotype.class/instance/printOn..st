printing
printOn: aStream
	" Private - See superimplementor's comment "

	aStream 
		nextPutAll: alleleA asString;
		space;
		nextPutAll: alleleB asString;
		nextPutAll: ' @ ';
		nextPutAll: locus asString;
		space