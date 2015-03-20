accessing
renameFromDictionary: aDictionary
	" Take aDictionary and rename each record accordingly "
	
	self do: [ : fastaRecord |
		| newName |
		newName := String streamContents: [ : stream |
			stream 
				nextPutAll: fastaRecord name;
				space;
				nextPutAll: (aDictionary at: fastaRecord sequenceNameWithoutDelimiter) ].
		fastaRecord name: newName ]