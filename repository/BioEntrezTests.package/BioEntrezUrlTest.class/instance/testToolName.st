testing
testToolName

	url := (BioEntrezUrl fromString: self baseUrl)
		toolName: 'BioSmalltalk';
		yourself.
	self assert: (url valueForParameter: 'tool') equals: 'BioSmalltalk'