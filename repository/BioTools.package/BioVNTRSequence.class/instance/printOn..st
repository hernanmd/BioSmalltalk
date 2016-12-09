printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	self genotype notNil
		ifTrue: [ aStream nextPutAll: self genotype asString; space ].
	(self alleleRangeStart notNil and: [ self alleleRangeEnd notNil  ])
		ifTrue: [ 
			aStream 
				space;
				nextPutAll: self alleleRangeStart asString;
				nextPutAll: ' - ';
				nextPutAll: self alleleRangeEnd asString ]