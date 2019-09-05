"
A chromosome is considered as a collection of (potentially overlapped) fragments (class BioChromosomeFragment). Each one of these fragments are either :

Transcribed Regions
Non-Transcribed Region 

A chromosome also belongs to a BioGenome.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #BioChromosome,
	#superclass : #BioNamedObject,
	#instVars : [
		'fragments',
		'genome',
		'genes'
	],
	#category : #'BioTools-Biological'
}

{ #category : #accessing }
BioChromosome >> addGene: aBioGene [
	" Add aBioGene as gene in the receiver's genes "
	
	self genes add: aBioGene
]

{ #category : #accessing }
BioChromosome >> fragments [
	^ fragments
]

{ #category : #accessing }
BioChromosome >> fragments: anObject [
	fragments := anObject
]

{ #category : #accessing }
BioChromosome >> genes [
	" Answer a <Collection> of <BioGene> "

	^ genes
		ifNil: [ genes := OrderedCollection new ]
]

{ #category : #accessing }
BioChromosome >> genes: anObject [
	genes := anObject
]

{ #category : #accessing }
BioChromosome >> genome [
	" Answer the receiver's genome "
	
	^ genome
]

{ #category : #accessing }
BioChromosome >> genome: anObject [
	genome := anObject
]

{ #category : #accessing }
BioChromosome >> removeGene: aBioGene [
	" Remove aBioGene as gene in the receiver's genes "
	
	^ self genes remove: aBioGene
]
