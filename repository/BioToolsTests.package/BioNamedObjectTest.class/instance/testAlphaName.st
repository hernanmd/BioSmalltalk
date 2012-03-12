testing
testAlphaName

	namedObject := BioAccession new.
	namedObject 
		addName: '425';
		addName: 'alpha'.
	self assert: namedObject alphaName = 'alpha'.
	
	namedObject := BioAccession new.
	self assert: namedObject alphaName = namedObject nullName.

	namedObject addName: String new.
	self assert: namedObject alphaName = String empty.	
	