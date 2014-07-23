printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self name between: $[ -> $];
		space.
	self locations ifNotNilDo: [: loc |
		aStream nextPutAll: loc between: $| -> $| ].
	aStream
		space;		
		nextPutAll: self synonyms size asString between: $( -> $);
		space;
		nextPutAll: self synonyms asString