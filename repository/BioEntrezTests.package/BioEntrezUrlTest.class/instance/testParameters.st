testing
testParameters

	| url |
	
	url := BioEntrezUrl absoluteFromText: self baseUrl.
	
	self assert: ( url parameters isKindOf: Collection ).
	self assert: ( url parameters isEmpty ).
	
	url setUseHistory.
	self assert: ( url parameters isKindOf: Collection ).
	self deny: ( url parameters isEmpty ).
	
