testing
testAccessBlastReader03
	" Accessing information about the BLAST "

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
		
	self deny: reader giList isEmpty.
	self assert: (reader giList bioHasEqualElements: self giList1).

	self deny: reader hitAccessions isEmpty.	
	self assert: (reader hitAccessions allSatisfy: [ : a | a isKindOf: BioAccession ]).
	self assert: reader hitAccessions size = 100.
	
	self deny: reader hitAccessionsAsTokens isEmpty.	
	self assert: (reader hitAccessionsAsTokens allSatisfy: [ : a | a isKindOf: Array ]).	
	self assert: reader hitAccessionsAsTokens size = 100.
	
	self deny: reader hitAccessionsAsString isEmpty.	
	self assert: ( reader hitAccessionsAsString allSatisfy: [ : a | a isKindOf: String ]).	
	self assert: reader hitAccessionsAsString size = 100.
	
	self deny: reader hitHsps isEmpty.
	self 
		assert: ( reader hitHsps allSatisfy: [ : a | a isKindOf: BioBlastNode ])
		description: 'Answer the nodes as a Collection of BioBlastNode hits'.
	self assert: reader hitHsps size = 100.	

	self deny: reader identities isEmpty.
	self assert: (reader identities allSatisfy: [: ident | ident isKindOf: String ]).
	self assert: reader identities size = 100