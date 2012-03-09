testing
testAccessFilter

	| emptyFilter |
	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
	
	emptyFilter := reader filter.
	self assert: ( emptyFilter isKindOf: BioBlastFilter ).
	self assert: emptyFilter reader = reader.
	self assert: emptyFilter contents isNil.