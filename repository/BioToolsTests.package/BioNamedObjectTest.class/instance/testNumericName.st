testing
testNumericName

	namedObject := BioAccession new.
	namedObject 
		addName: 'alpha';	
		addName: '425'.
	self assert: namedObject numericName = '425'.

	namedObject := BioAccession new.
	namedObject 
		addName: 'alpha';	
		addName: 425.
	self assert: namedObject numericName = 425.