accessing
formatter

	^ formatter
		ifNil: [ formatter := BioXMLDictionaryMap new ]