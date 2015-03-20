testing
testAt

	self assert: ( table isKindOf: BioCodonTable ).
	self assert: table tableId = 1.

	table := BioDNACodonTables atCodonTable: 2.
	self assert: ( table isKindOf: BioCodonTable ).
	self assert: table tableId = 2.
	
	self should: [ BioDNACodonTables atCodonTable: 7 ] raise: BioException.	
	self should: [ BioDNACodonTables atCodonTable: 5000 ] raise: BioException.

	table := BioRNACodonTables atCodonTable: 1.
	self assert: ( table isKindOf: BioCodonTable ).
	self assert: table tableId = 1.

	table := BioRNACodonTables atCodonTable: 2.
	self assert: ( table isKindOf: BioCodonTable ).
	self assert: table tableId = 2.
	
	self should: [ BioRNACodonTables atCodonTable: 7 ] raise: BioException.	
	self should: [ BioRNACodonTables atCodonTable: 5000 ] raise: BioException.