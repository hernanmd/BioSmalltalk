testing
testIsStartCodon

	| codonTable |
	
	codonTable := BioDNACodonTables atCodonTable: 1.
	self assert: ( codonTable isStartCodon: 'ttg' ).
	self assert: ( codonTable isStartCodon: 'CTG' ).
	self deny: ( codonTable isStartCodon: 'ATC' ).
	self deny: ( codonTable isStartCodon: String empty ).

	codonTable := BioDNACodonTables atCodonTable: 15.
	self assert: ( codonTable isStartCodon: 'ATG' ).
	self deny: ( codonTable isStartCodon: 'ATC' ).
