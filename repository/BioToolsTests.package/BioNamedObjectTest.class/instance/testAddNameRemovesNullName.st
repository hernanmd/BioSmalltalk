testing
testAddNameRemovesNullName

	namedObject := BioAccession new.
	self assert: namedObject includesNullName.
	
	namedObject name: 'accessionName1'.
	self deny: namedObject includesNullName.
	