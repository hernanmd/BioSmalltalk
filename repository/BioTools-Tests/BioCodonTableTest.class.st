Class {
	#name : #BioCodonTableTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'table'
	],
	#category : #'BioTools-Tests-Biological'
}

{ #category : #running }
BioCodonTableTest >> setUp [
	" Assure defaults "

	super setUp.
	table := BioDNACodonTables atCodonTable: 1.
]

{ #category : #running }
BioCodonTableTest >> tearDown [
	" Reset to defaults "

	super tearDown.
	BioDNACodonTables atCodonTable: 1.
]

{ #category : #testing }
BioCodonTableTest >> testAt [

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
]

{ #category : #testing }
BioCodonTableTest >> testCodonTables [

	| tables |
	
	BioDNACodonTables release.
	tables := BioDNACodonTables codonTables.
	self assert: (tables isKindOf: Collection).
	self assert: tables size = 17.

	BioRNACodonTables release.
	tables := BioRNACodonTables codonTables.
	self assert: (tables isKindOf: Collection).
	self assert: tables size = 17.

]

{ #category : #testing }
BioCodonTableTest >> testDo [

	| tempCodonTables |
	
	tempCodonTables := OrderedCollection new: BioDNACodonTables codonTables size.
	BioDNACodonTables do: [: codonTable | tempCodonTables addLast: codonTable].
	self assert: ( tempCodonTables bioHasEqualElements: BioDNACodonTables codonTables )

]

{ #category : #testing }
BioCodonTableTest >> testIsStartCodon [

	| codonTable |
	
	codonTable := BioDNACodonTables atCodonTable: 1.
	self assert: ( codonTable isStartCodon: 'ttg' ).
	self assert: ( codonTable isStartCodon: 'CTG' ).
	self deny: ( codonTable isStartCodon: 'ATC' ).
	self deny: ( codonTable isStartCodon: String empty ).

	codonTable := BioDNACodonTables atCodonTable: 15.
	self assert: ( codonTable isStartCodon: 'ATG' ).
	self deny: ( codonTable isStartCodon: 'ATC' ).

]

{ #category : #testing }
BioCodonTableTest >> testIsStopCodon [

	| codonTable |
	
	codonTable := BioDNACodonTables atCodonTable: 1.
	self assert: ( codonTable isStopCodon: 'taa' ).
	self assert: ( codonTable isStopCodon: 'tag' ).
	self deny: ( codonTable isStopCodon: 'gtg' ).
	self deny: ( codonTable isStopCodon: String empty ).

	codonTable := BioDNACodonTables atCodonTable: 13.
	self assert: ( codonTable isStopCodon: 'TAG' ).
	self deny: ( codonTable isStopCodon: 'CCA' ).

]

{ #category : #testing }
BioCodonTableTest >> testReverseTranslate [

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
]

{ #category : #testing }
BioCodonTableTest >> testTableAllNames [

	self assert: ( BioDNACodonTables tableAllNames isKindOf: Collection ).
	self assert: ( BioDNACodonTables tableAllNames allSatisfy: [: tNames | tNames size >= 2 ] ).
	self assert: ( BioDNACodonTables tableAllNames allSatisfy: [: tNames | tNames first isNumber and: [ tNames second isString ] ] )
	

]

{ #category : #testing }
BioCodonTableTest >> testTableIdentifiers [

	self assert: ( BioDNACodonTables tableIdentifiers isKindOf: Collection ).
	self assert: ( BioDNACodonTables tableIdentifiers allSatisfy: #isNumber ).

	

]

{ #category : #testing }
BioCodonTableTest >> testTableNames [

	self assert: ( BioDNACodonTables tableNames isKindOf: Collection ).
	self assert: ( BioDNACodonTables tableNames allSatisfy: #isString ).
	self assert: ( BioDNACodonTables tableNames allSatisfy: [: n | n isAllDigits not ] )
	

]

{ #category : #testing }
BioCodonTableTest >> testTranslateAmbiguous [

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
	

]

{ #category : #testing }
BioCodonTableTest >> testTranslateUnambiguous [

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
	

]
