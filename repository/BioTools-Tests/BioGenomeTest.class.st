Class {
	#name : #BioGenomeTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'genome'
	],
	#category : #'BioTools-Tests-Biological'
}

{ #category : #accessing }
BioGenomeTest >> genome [
	^ genome
]

{ #category : #accessing }
BioGenomeTest >> genome: anObject [
	genome := anObject
]

{ #category : #running }
BioGenomeTest >> setUp [
	" Assure defaults "

	super setUp.
	genome := BioGenome new.
]

{ #category : #testing }
BioGenomeTest >> testChromosomes [

	self assert: (self genome chromosomes isKindOf: self genome defaultCollectionClass) 
]
