testing
testAddFilterBlastReader01

	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
	self assert: reader filters isEmpty.	
	reader filter definitionsBeginWith: #('Bos taurus').

	self deny: reader filters isNil.
	self assert: reader filters isCollection.
	self deny: reader filters isEmpty.
	self assert: ( reader filters allSatisfy: [: f | f isKindOf: BioBlastFilter ] ).
