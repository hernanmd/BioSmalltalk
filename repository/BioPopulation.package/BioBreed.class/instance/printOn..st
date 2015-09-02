printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self name between: $[ and: $];
		space.
	self locations ifNotNilDo: [: loc |
		aStream nextPutAll: loc between: $| and: $| ].
	aStream
		space;		
		nextPutAll: self synonyms size asString between: $( and: $);
		space;
		nextPutAll: self synonyms asString