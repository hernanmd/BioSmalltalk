testing
testIsStopCodon

	| codonTable |
	
	codonTable := BioDNACodonTables atCodonTable: 1.
	self assert: ( codonTable isStopCodon: 'taa' ).
	self assert: ( codonTable isStopCodon: 'tag' ).
	self deny: ( codonTable isStopCodon: 'gtg' ).
	self deny: ( codonTable isStopCodon: String empty ).

	codonTable := BioDNACodonTables atCodonTable: 13.
	self assert: ( codonTable isStopCodon: 'TAG' ).
	self deny: ( codonTable isStopCodon: 'CCA' ).
