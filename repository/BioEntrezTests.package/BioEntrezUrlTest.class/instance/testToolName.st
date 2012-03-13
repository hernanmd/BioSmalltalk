testing
testToolName

	| url |
	
	url := BioEntrezUrl absoluteFromText: self baseUrl.
	url toolName: 'BioSmalltalk'.
	
	self assert: ( url valueForParameter: 'tool' ) = 'BioSmalltalk'