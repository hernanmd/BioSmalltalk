testing
testSizeExcludeTerminals

	self sequence: ( BioSequence newWith: 'MAASEHRCVGCGFRVKSLF*' alphabet: BioIUPACProtein ).
	self assert: self sequence size = 20.
	self assert: self sequence sizeExcludeTerminals = 19.
	
	self sequence: ( BioSequence newWith: 'MAASEHRCVGCGFRVKSLF*AMKLMNO*P' alphabet: BioIUPACProtein ).
	self assert: self sequence size = 29.
	self assert: self sequence sizeExcludeTerminals = 27.