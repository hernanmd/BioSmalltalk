testing
testAsString

	self assert: (BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself) asString = 'AF288373.2'.
	self assert: (BioAccession new 
					name: String empty;
					yourself) asString = String empty.
