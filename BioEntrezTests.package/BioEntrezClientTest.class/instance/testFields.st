testing
testFields

	self entrezClient: BioEntrezClient new pubmed.

	self assert: ( self entrezClient fields isKindOf: Collection ).
	self deny: self entrezClient fields isEmpty.
