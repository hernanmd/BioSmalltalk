testing
testRettypeFields

	self entrezClient: BioEntrezClient new pubmed.

	self assert: ( self entrezClient rettypeFields isKindOf: Collection ).
	self deny: self entrezClient rettypeFields isEmpty.
