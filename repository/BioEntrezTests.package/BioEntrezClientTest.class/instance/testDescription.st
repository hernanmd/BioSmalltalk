testing
testDescription

	self entrezClient: BioEntrezClient new nuccore.

	self assert: ( self entrezClient class description isKindOf: String ).
	self deny: self entrezClient class description isEmpty.
