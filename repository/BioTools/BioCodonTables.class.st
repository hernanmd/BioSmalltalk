"
Codon tables (also called translation tables or genetic codes) describe how the triplet codon of RNA (or DNA) is read by specific tRNAs to map to a particular amino acid.

Comprehensive information about codon usage in different organisms can be found at the NCBI Taxonomy site:

http://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi

"
Class {
	#name : #BioCodonTables,
	#superclass : #BioObject,
	#classVars : [
		'CurrentCodonTable'
	],
	#classInstVars : [
		'codonTables'
	],
	#category : #'BioTools-Biological'
}

{ #category : #accessing }
BioCodonTables class >> atCodonTable: anInteger [
	" Select and answer a Codon Table by number anInteger "
	
	| cTable |
	
	cTable := self codonTables 
			detect: [ : codonTable | codonTable tableId = anInteger ]
			ifNone: [ 
				self missingCodonTable: anInteger.
				self error. ].
	self currentCodonTable: cTable.
	^ cTable
]

{ #category : #accessing }
BioCodonTables class >> codonTables [
	" Answer a <Collection> of codon tables "

	^ codonTables
		ifNil: [ 
			self initialize.
			codonTables ]
]

{ #category : #accessing }
BioCodonTables class >> codonTables: anObject [
	codonTables := anObject
]

{ #category : #accessing }
BioCodonTables class >> currentCodonTable [

	^ CurrentCodonTable
		ifNil: [ CurrentCodonTable := self defaultCodonTable ]
]

{ #category : #accessing }
BioCodonTables class >> currentCodonTable: anObject [
	CurrentCodonTable := anObject
]

{ #category : #accessing }
BioCodonTables class >> defaultCodonTable [
	" Answer the default codon table for translations "
	
	^ BioDNACodonTables atCodonTable: 1
]

{ #category : #enumerating }
BioCodonTables class >> do: aBlock [
	" Iterate and evaluate aBlock with each codon of the receiver's elements as the argument."
	
	self codonTables do: [ : each | aBlock value: each ]
]

{ #category : #accessing }
BioCodonTables class >> isStopCodon: aCodon [
	" Answer <true> if aCodon is a stop codon in the receiver "
	
	^ self currentCodonTable isStopCodon: aCodon
]

{ #category : #accessing }
BioCodonTables class >> missingCodonTable: anInteger [
	" Private - Throw an exception for missing codon table numbered anInteger "
	
	| exceptionString |
	
	exceptionString := String streamContents: [ : stream | 
			stream 
				nextPutAll: anInteger asString;
				space;
				nextPutAll: 'codon table not found' translated ].
	self signalNotFound: exceptionString
]

{ #category : #'initialize-release' }
BioCodonTables class >> newCodonTable: tableClass selectors: tableSelectors [
	" Private - Create a new codon table with the information in tableSelectors "
	| codonTable tableIdSelector tableNames table tableStartCodons tableStopCodons |
	
	tableIdSelector 	:= tableSelectors detect: [ : s | s endsWith: 'Id' ].
	tableNames 		:= tableSelectors detect: [ : s | s endsWith: 'TableNames' ].
	table 				:= tableSelectors detect: [ : s | s endsWith: 'Table' ].
	tableStartCodons 	:= tableSelectors detect: [ : s | s endsWith: 'StartCodons' ].
	tableStopCodons 	:= tableSelectors detect: [ : s | s endsWith: 'StopCodons' ].
	codonTable := BioCodonTable new 
				addName: (tableClass perform: tableIdSelector);
				table: (tableClass perform: table);
				startCodons: (tableClass perform: tableStartCodons);
				stopCodons: (tableClass perform: tableStopCodons);
				yourself.
	(tableClass perform: tableNames) do: [ : tbName | codonTable addName: tbName ].
	^ codonTable 
]

{ #category : #printing }
BioCodonTables class >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	self subclasses isEmpty
		ifTrue: [ aStream nextPutAll: self codonTables size asString ]
]

{ #category : #'initialize-release' }
BioCodonTables class >> release [

	self codonTables: nil.
	CurrentCodonTable := nil
]

{ #category : #accessing }
BioCodonTables class >> reverseTranslate: aString [
	" Answer a codon String by aString amino acid "

	| translations |
	
	translations := OrderedCollection new.	
	self currentCodonTable keysAndValuesDo: [ :k :v |
			v = aString asUppercase
				ifTrue: [ translations addLast: k ] ].
	translations
		ifEmpty: [ self signalNotFound: aString asString , ' amino acid codon not found' ].
	^ translations
]

{ #category : #enumerating }
BioCodonTables class >> tableAllNames [
	" Answer a Collection of codon table identifiers "
	
	^ self codonTables collect: #names
]

{ #category : #private }
BioCodonTables class >> tableClass [
	" Answer the Collection class used to store the codon tables "
	
	^ Dictionary
]

{ #category : #enumerating }
BioCodonTables class >> tableIdentifiers [
	" Answer a Collection of codon table identifiers "
	
	^ self codonTables collect: #name
]

{ #category : #enumerating }
BioCodonTables class >> tableNames [
	" Answer a Collection of codon table identifiers "
	
	^ self codonTables collect: #alphaName
]

{ #category : #private }
BioCodonTables class >> tableSelectors [

	^ self class selectorsInProtocol: #tables
]

{ #category : #accessing }
BioCodonTables class >> translate: aCodonString [
	" Answer a translated amino acid by aCodonString "
	
	^ self currentCodonTable 
			at: aCodonString asUppercase
			ifAbsent: [ self signalNotFound: aCodonString asString , ' codon String not found' ]
]
