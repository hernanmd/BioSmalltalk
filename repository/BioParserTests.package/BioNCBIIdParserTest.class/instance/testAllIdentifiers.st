testing
testAllIdentifiers

	| identifiers |
	
	identifiers := self parserClass allIdentifiers.
	
	self assert: (identifiers isKindOf: Collection).
	self assert: (identifiers hasEqualElements: #('pdb' 'bbs' 'gi' 'gnl' 'lcl' 'pat' 'pir' 'prf' 'sp' 'dbj' 'emb' 'gb' 'ref')).