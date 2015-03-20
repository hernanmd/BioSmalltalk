testing
testTranslateAmbiguous

	| tempCodonTables |
	
	BioDNACodonTables atCodonTable: 1.
	self assert: ( BioDNACodonTables translate: 'ttt' ) = 'F'.
	self assert: ( BioDNACodonTables translate: 'AAA' ) = 'K'.
	self assert: ( BioDNACodonTables translate: 'cTa' ) = 'L'.
	self should: [ BioDNACodonTables translate: 'tt' ] raise: BioException.
	self should: [ BioDNACodonTables translate: 'pppp' ] raise: BioException.

	BioDNACodonTables atCodonTable: 9.
	self assert: ( BioDNACodonTables translate: 'TTT' ) = 'F'.
	self assert: ( BioDNACodonTables translate: 'AAA' ) = 'N'.
	self assert: ( BioDNACodonTables translate: 'GAG' ) = 'E'.
	self should: [ BioDNACodonTables translate: 'GUG' ] raise: BioException.
	self should: [ BioDNACodonTables translate: 'pppp' ] raise: BioException.
	
