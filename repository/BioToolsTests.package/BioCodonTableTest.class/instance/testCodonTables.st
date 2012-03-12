testing
testCodonTables

	| tables |
	
	tables := BioDNACodonTables codonTables.
	self assert: ( tables isKindOf: Collection ).
	self assert: tables size = 17.
