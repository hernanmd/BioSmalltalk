as yet unclassified
printOn: aStream

	aStream 
		nextPut: alleleA;
		space;
		nextPut: alleleB;
		nextPutAll: ' @ ';
		nextPutAll: locus asString;
		space