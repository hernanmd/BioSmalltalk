"
Represents a gene. A gene could be represented as a string of DNA encoding for a protein.

"
Class {
	#name : #BioGene,
	#superclass : #BioNamedObject,
	#instVars : [
		'chromosome',
		'proteins',
		'entrezGeneID',
		'ensemblGeneID',
		'geneBankAccession',
		'unigeneClusterID',
		'sequences'
	],
	#category : #'BioTools-Biological'
}

{ #category : #comparing }
BioGene >> = aBioGene [
	" Answer <true> if receiver's is equal to aBioGene "
	
	^ self class = aBioGene class
]

{ #category : #accessing }
BioGene >> chromosome [
	" Answer the receiver's <BioChromosome> "

	^ chromosome
]

{ #category : #accessing }
BioGene >> chromosome: anObject [
	chromosome := anObject
]

{ #category : #accessing }
BioGene >> ensemblGeneID [
	^ ensemblGeneID
]

{ #category : #accessing }
BioGene >> ensemblGeneID: anObject [
	ensemblGeneID := anObject
]

{ #category : #accessing }
BioGene >> entrezGeneID [
	^ entrezGeneID
]

{ #category : #accessing }
BioGene >> entrezGeneID: anObject [
	entrezGeneID := anObject
]

{ #category : #accessing }
BioGene >> geneBankAccession [
	^ geneBankAccession
]

{ #category : #accessing }
BioGene >> geneBankAccession: anObject [
	geneBankAccession := anObject
]

{ #category : #accessing }
BioGene >> proteins [
	" Answer a <Collection> of reciever's protein "

	^ proteins
		ifNil: [ proteins := OrderedCollection new ]
]

{ #category : #accessing }
BioGene >> proteins: anObject [
	proteins := anObject
]

{ #category : #accessing }
BioGene >> sequences [
	^ sequences
]

{ #category : #accessing }
BioGene >> sequences: anObject [
	sequences := anObject
]

{ #category : #accessing }
BioGene >> unigeneClusterID [
	^ unigeneClusterID
]

{ #category : #accessing }
BioGene >> unigeneClusterID: anObject [
	unigeneClusterID := anObject
]
