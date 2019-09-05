"
Represents fully sequenced individual genome. It does not capture the experimental data generated during the sequencing.

A genome consists of a collection of chromosomes and contains at least one chromosome.


chromosomes 		<Collection>
collectionClass 	<Class>
organism 			<String>

"
Class {
	#name : #BioGenome,
	#superclass : #BioNamedObject,
	#instVars : [
		'chromosomes',
		'collectionClass',
		'organism'
	],
	#category : #'BioTools-Biological'
}

{ #category : #accessing }
BioGenome >> addChromosome: aBioChromosome [
	" Add aBioChromosome to the receiver's chromosomes "

	self chromosomes add: (aBioChromosome
		genome: self;
		yourself)
]

{ #category : #accessing }
BioGenome >> addGene: aBioObject [
	" Store aBioObject as gene in the receiver's genes "
	
	^ aBioObject addToBioGenome: self
]

{ #category : #accessing }
BioGenome >> chromosomes [
	" Answer a <Collection> of <BioChromosome> for the receiver "

	^ chromosomes
		ifNil: [ chromosomes := self collectionClass new ]
]

{ #category : #accessing }
BioGenome >> chromosomes: anObject [
	chromosomes := anObject
]

{ #category : #accessing }
BioGenome >> collectionClass [
	" Answer a <Class> used to store the receiver's chromosomes "

	^ collectionClass
		ifNil: [ collectionClass := self defaultCollectionClass ]
]

{ #category : #accessing }
BioGenome >> collectionClass: anObject [
	collectionClass := anObject
]

{ #category : #defaults }
BioGenome >> defaultCollectionClass [
	" Answer the default class to store chromosomes in the receiver "

	^ OrderedCollection 
]

{ #category : #accessing }
BioGenome >> genes [
	" Answer a <Collection> of <BioGene> in the receiver "
	
	^ self chromosomes collect: #genes
]

{ #category : #accessing }
BioGenome >> organism [
	^ organism
]

{ #category : #accessing }
BioGenome >> organism: anObject [
	organism := anObject
]
