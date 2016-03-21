testing
testFilterBlastReader01

	| hits |
	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
	reader filter definitionsBeginWith: #('Bos taurus').
	hits := reader hits.

	self assert: hits isCollection.
	self deny: hits isEmpty.
	self assert: (hits allSatisfy: [ : each | each isKindOf: BioBlastNode ]).

	self assert: hits size = 87.
	self assert: hits first nodeName = 'Hit'.
	self assert: hits first nodes isCollection