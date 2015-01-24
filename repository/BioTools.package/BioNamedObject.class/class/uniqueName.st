accessing
uniqueName
	" Answer a <String> intended to represent a unique identifier "
	
	^ String streamContents: [ : stream |
		stream 
			nextPut: $-;
			nextPutAll: UUID new asString36 ]
	