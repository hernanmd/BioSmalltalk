testing
testAccessFilterBlastReader02

	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
	reader filter alignsWithMinLength: 235.

	self assert: reader hits isCollection.
	self deny: reader hits isEmpty.
"	self assert: reader hits size = 100 "
