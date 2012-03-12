testing
testTableIdentifiers

	self assert: ( BioDNACodonTables tableIdentifiers isKindOf: Collection ).
	self assert: ( BioDNACodonTables tableIdentifiers allSatisfy: #isNumber ).

	
