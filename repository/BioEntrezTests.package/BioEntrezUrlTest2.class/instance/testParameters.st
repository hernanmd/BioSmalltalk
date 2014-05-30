testing
testParameters

	url := BioEntrezUrl2 fromString: self baseUrl.
	
	self assert: (url parameters isKindOf: Collection).
	self assert: (url parameters isEmpty).
	
	url setUseHistory.
	self assert: (url parameters isKindOf: Collection).
	self deny: (url parameters isEmpty).
	self assert: url parameters equals: (Array with: 'usehistory')
	
