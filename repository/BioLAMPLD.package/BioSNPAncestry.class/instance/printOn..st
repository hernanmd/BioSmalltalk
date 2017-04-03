printing
printOn: aStream
	" Private - See superimplementor's comment "

	aStream
		nextPutAll: 'Pos: ';
		nextPutAll: self position asString;
		nextPutTerminator;
		nextPutAll: 'Avg: ';
		nextPutAll: self average asString		