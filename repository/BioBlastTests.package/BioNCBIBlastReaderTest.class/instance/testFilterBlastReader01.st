testing
testFilterBlastReader01

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader filter definitionsBeginWith: #('Bos taurus').

	self assert: reader hits isCollection.
	self deny: reader hits isEmpty.
	self assert: ( reader hits allSatisfy: [: each | each isKindOf: BioBlastNode ] ).

	self assert: reader hits size = 87.
	self assert: reader hits first nodeName = 'Hit'.
	self assert: reader hits first nodes isCollection