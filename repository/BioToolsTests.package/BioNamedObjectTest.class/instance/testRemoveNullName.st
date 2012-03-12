testing
testRemoveNullName

	namedObject := BioAccession new.
	self assert: namedObject includesNullName.
	
	namedObject removeNullName.
	self deny: namedObject includesNullName.

	