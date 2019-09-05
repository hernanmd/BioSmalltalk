"
A genotype is a particular combination of alleles given at a specific locus (position) of a gene.

The genotype is also defined as an individual's collection of genes.

Internal Representation and Key Implementation Points.

    Instance Variables
	alleleA:		<Object>
	alleleB:		<Object>
	locus:		<Object>


    Implementation Points
"
Class {
	#name : #BioGenotype,
	#superclass : #BioObject,
	#instVars : [
		'alleleA',
		'alleleB',
		'locus'
	],
	#category : #'BioTools-Biological'
}

{ #category : #'instance creation' }
BioGenotype class >> withSpacedAlleles: aString [
	" Answer a new receiver's instance from aString interpreted as two unspaced alleles, e.g.: 'AC' or 'CT' "

	| fmt |	
	fmt := aString = '---' ifTrue: [ '00' ] ifFalse: [ aString ].
	^ self new
		alleleA: fmt first;
		alleleB: fmt last;
		yourself
	
]

{ #category : #comparing }
BioGenotype >> = aNucleotide [

	self == aNucleotide ifTrue: [ ^ true ].
	^ self alleleA = aNucleotide and: [ self alleleB = aNucleotide ]
]

{ #category : #accessing }
BioGenotype >> alleleA [
	^ alleleA
]

{ #category : #accessing }
BioGenotype >> alleleA: anObject [
	" Set the receiver's first allele "

	alleleA := anObject
]

{ #category : #accessing }
BioGenotype >> alleleB [
	^ alleleB
]

{ #category : #accessing }
BioGenotype >> alleleB: anObject [
	alleleB := anObject
]

{ #category : #accessing }
BioGenotype >> end [
	" Answer the receiver's <BioLocus> end position "

	^ self locus end
]

{ #category : #accessing }
BioGenotype >> end: anObject [
	" See comment in <BioLocus> "

	self locus end: anObject.

	
]

{ #category : #comparing }
BioGenotype >> hash [
	"hash is implemented because #= is implemented"

	^ self alleleA hash bitXor: self alleleB hash
]

{ #category : #accessing }
BioGenotype >> locus [
	" Answer the receiver's <BioLocus> "

	^ locus
		ifNil: [ locus := BioLocus new ]
]

{ #category : #accessing }
BioGenotype >> locus: aBioLocus [
	" Set the receiver's locus to be aBioLocus "

	locus := aBioLocus
]

{ #category : #printing }
BioGenotype >> printOn: aStream [
	" Private - See superimplementor's comment "

	aStream 
		nextPutAll: alleleA asString;
		space;
		nextPutAll: alleleB asString;
		nextPutAll: ' @ ';
		nextPutAll: locus asString;
		space
]

{ #category : #accessing }
BioGenotype >> start [
	" Answer the receiver's <BioLocus> "

	^ self locus start
]

{ #category : #accessing }
BioGenotype >> start: anObject [
	" See comment in <BioLocus> "

	self locus start: anObject.

	
]

{ #category : #comparing }
BioGenotype >> ~= aNucleotide [

	self == aNucleotide ifTrue: [ ^ false ].
	^ self alleleA ~=  aNucleotide and: [ self alleleB ~= aNucleotide ]
]
