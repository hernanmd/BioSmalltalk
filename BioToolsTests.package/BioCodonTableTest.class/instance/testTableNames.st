testing
testTableNames

	self assert: ( BioDNACodonTables tableNames isKindOf: Collection ).
	self assert: ( BioDNACodonTables tableNames allSatisfy: #isString ).
	self assert: ( BioDNACodonTables tableNames allSatisfy: [: n | n isAllDigits not ] )
	
