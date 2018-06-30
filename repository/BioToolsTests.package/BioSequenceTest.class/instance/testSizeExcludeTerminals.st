testing
testSizeExcludeTerminals

	self sequence: (BioSequence newWith: 'MAASEHRCVGCGFRVKSLF*' alphabet: BioIUPACProtein).
	self assert: self sequence size equals: 20.
	self assert: self sequence sizeExcludeTerminals equals: 19.
	
	self sequence: (BioSequence newWith: 'MAASEHRCVGCGFRVKSLF*AMKLMNO*P' alphabet: BioIUPACProtein).
	self assert: self sequence size equals: 29.
	self assert: self sequence sizeExcludeTerminals equals: 27.