accessing
outputAsCsvTo: aStream

	" names should never be empty "
	self names do: [: each | 
		aStream nextPutAll: each; nextPut: $, ].
	aStream 
		back;
		nextPut: $;.
	self synonyms isEmpty
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ 
			self synonyms do: [ : each | aStream nextPutAll: each; nextPut: $, ].
			aStream back ].
	aStream nextPut: $;.
	self locations isEmpty
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ self locations do: [: each | 
					aStream 
						nextPutAll: each; 
						nextPut: $, ].
					aStream back ].