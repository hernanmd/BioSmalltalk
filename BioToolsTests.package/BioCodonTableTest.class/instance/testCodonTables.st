testing
testCodonTables

	| tables |
	
	BioDNACodonTables release.
	tables := BioDNACodonTables codonTables.
	self assert: (tables isKindOf: Collection).
	self assert: tables size = 17.

	BioRNACodonTables release.
	tables := BioRNACodonTables codonTables.
	self assert: (tables isKindOf: Collection).
	self assert: tables size = 17.
