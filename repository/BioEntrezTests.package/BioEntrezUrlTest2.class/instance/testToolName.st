testing
testToolName

	url := (BioEntrezUrl2 fromString: self baseUrl)
		toolName: 'BioSmalltalk';
		yourself.
	self assert: (url valueForParameter: 'tool') equals: 'BioSmalltalk'