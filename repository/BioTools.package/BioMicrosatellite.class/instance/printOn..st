printing
printOn: aStream

	aStream
		nextPutAll: self name asString between: $[ and: $].
	self positions ifNotNil: [ 
		aStream 
			space;
			nextPutAll: self alleleRangeStart;
			nextPutAll: ' - ';
			nextPutAll: self alleleRangeEnd ]