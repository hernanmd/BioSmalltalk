accessing
writeOn: aStream delimiter: aDelimiterCharacter

	aStream 
		nextPutAll: self identifier;
		nextPut: aDelimiterCharacter;
		nextPutAll: self frequency asString;
		nextPut: aDelimiterCharacter