testing
testCreationAppendDb

	| url |
	
	url := BioEntrezUrl absoluteFromText: self baseUrl.
	url dbName: 'nuccore'.
	
	self assert: ( url fileName = 'db=nuccore' )