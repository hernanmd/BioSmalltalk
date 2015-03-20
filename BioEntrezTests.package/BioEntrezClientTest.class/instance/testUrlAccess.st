testing
testUrlAccess

	| db |
	db := self entrezClient nuccore.
	self assert: (db url isKindOf: BioEntrezUrl).
	self assert: (db downloadUrl isKindOf: String).
	self assert: db url scheme = 'http'.
	self assert: db url authority = 'eutils.ncbi.nlm.nih.gov'.
	self assert: (db url webClient isKindOf: BioWebClientEngine).
