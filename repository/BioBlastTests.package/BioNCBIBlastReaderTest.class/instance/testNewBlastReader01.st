testing
testNewBlastReader01

	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
	
	self assert: ( reader isKindOf: BioNCBIBlastReader ).
	self assert: reader filters isCollection.
	self assert: reader filters isEmpty.

