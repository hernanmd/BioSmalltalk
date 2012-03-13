testing
testUrlAccess

	| db |
	
	db := self entrezClient nuccore.
	self assert: ( db url isKindOf: BioHttpUrl ).
	self assert: db url schemeName = 'http'.
	self assert: db url authority = 'eutils.ncbi.nlm.nih.gov'.
	self assert: ( db url webClient isKindOf: BioWebClientEngine ).
	
	self assert: ( db downloadUrl isKindOf: String ).