"
Refer to class comment in BioCodonTables

Instance Variables
	startCodons:		<Object>
	stopCodons:		<Object>
	table:		<Object>

startCodons
	- xxxxx

stopCodons
	- xxxxx

table
	- xxxxx

"
Class {
	#name : #BioCodonTable,
	#superclass : #BioNamedObject,
	#instVars : [
		'table',
		'startCodons',
		'stopCodons'
	],
	#category : #'BioTools-Biological'
}

{ #category : #comparing }
BioCodonTable >> <= aCodonTable [
	"Answer whether the receiver is less than the argument."
	
	^ self alphaName <= aCodonTable alphaName
]

{ #category : #comparing }
BioCodonTable >> = codonTable [
	" Answer <true> if receiver contains the same codon table as codonTable and start/stop codons "

	^ (self table = codonTable table and: [ self startCodons = codonTable startCodons ])
		and: [ self stopCodons = codonTable stopCodons ]
]

{ #category : #accessing }
BioCodonTable >> at: aCodonString [
	" Answer the amino acid associated with aCodonString or, if isn't found, answer the result of evaluating aBlock. "

	^ self table 
			at: aCodonString 
			ifAbsent: [ self signalNotFound: 'Amino acid not found for ' , aCodonString asString ]
]

{ #category : #accessing }
BioCodonTable >> at: aCodonString ifAbsent: aBlock [
	" Answer the amino acid associated with aCodonString or, if isn't found,
	answer the result of evaluating aBlock. "

	^ self table at: aCodonString ifAbsent: aBlock
]

{ #category : #comparing }
BioCodonTable >> hash [
	" Private - hash is implemented because #= is implemented "
	
	^ self table hash bitXor: (self startCodons hash bitXor: self stopCodons hash)
]

{ #category : #testing }
BioCodonTable >> isStartCodon: aCodon [
	" Answer <true> if aCodon is a start codon in the receiver "
	
	^ self startCodons includes: aCodon asUppercase
]

{ #category : #testing }
BioCodonTable >> isStopCodon: aCodon [
	" Answer <true> if aCodon is a stop codon in the receiver "
	
	^ self stopCodons includes: aCodon asUppercase
]

{ #category : #accessing }
BioCodonTable >> keyAtValue: aCodonString ifAbsent: aBlock [
	" Answer the amino acid associated with aCodonString or, if isn't found,
	answer the result of evaluating aBlock. "

	^ self table 
			keyAtValue: aCodonString 
			ifAbsent: aBlock
]

{ #category : #accessing }
BioCodonTable >> keysAndValuesDo: aBlock [
	"Enumerate the receiver with all the keys and values passed to the block"
	
	^ self table keysAndValuesDo: aBlock
]

{ #category : #printing }
BioCodonTable >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	aStream 
		space;
		nextPutAll: self tableId asString between: $[ and: $];
		space;
		nextPutAll: self alphaName.

]

{ #category : #accessing }
BioCodonTable >> startCodons [
	^ startCodons
]

{ #category : #accessing }
BioCodonTable >> startCodons: anObject [
	startCodons := anObject
]

{ #category : #accessing }
BioCodonTable >> stopCodons [
	^ stopCodons
]

{ #category : #accessing }
BioCodonTable >> stopCodons: anObject [
	stopCodons := anObject
]

{ #category : #accessing }
BioCodonTable >> table [
	^ table
]

{ #category : #accessing }
BioCodonTable >> table: anObject [
	table := anObject
]

{ #category : #accessing }
BioCodonTable >> tableId [
	" Answer a Number with the receiver's table number "
	
	^ self numericName
]
