testing
testReverseTranslate

	| tempCodonTables translation translated |
	
	BioDNACodonTables atCodonTable: 1.
	self deny: ( BioDNACodonTables reverseTranslate: 'f' ) isString.
	self assert: ( ( BioDNACodonTables reverseTranslate: 'f' ) isKindOf: Collection ).
	
	translation := BioDNACodonTables reverseTranslate: 'A'.
	translated := { 'gcg' . 'gct' . 'gca' . 'gcc' } collect: #asUppercase.
	self assert: ( translation bioHasEqualElements: translated  ).
	
	translation := BioDNACodonTables reverseTranslate: 'K'.
	translated := { 'AAA' . 'AAG' }.
	self assert: ( translation bioHasEqualElements: translated ).
	
	self should: [ BioDNACodonTables reverseTranslate: 'TT' ] raise: BioException.
	self should: [ BioDNACodonTables reverseTranslate: 'PPP' ] raise: BioException.

	BioDNACodonTables atCodonTable: 6.
	translation := BioDNACodonTables reverseTranslate: 'P'.
	translated := { 'CCT' . 'CCA' . 'CCC' . 'CCG' }.
	self assert: ( translation bioHasEqualElements: translated ).

	self should: [ BioDNACodonTables reverseTranslate: 'GUG' ] raise: BioException.
	self should: [ BioDNACodonTables reverseTranslate: 'pppp' ] raise: BioException.
	BioDNACodonTables atCodonTable: 1.