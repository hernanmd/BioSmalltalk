Class {
	#name : #BioAffyProbeSetRecord,
	#superclass : #Object,
	#instVars : [
		'id',
		'chr',
		'position',
		'markers'
	],
	#category : 'BioAffymetrix-Axiom'
}

{ #category : #comparing }
BioAffyProbeSetRecord >> < aBioAffyProbetSetRecord [

	^ self chr <= aBioAffyProbetSetRecord chr
		and: [ self position < aBioAffyProbetSetRecord position ]
]

{ #category : #comparing }
BioAffyProbeSetRecord >> <= aBioAffyProbetSetRecord [

	self chr < aBioAffyProbetSetRecord chr
		ifTrue: [ ^ true ].
	self chr = aBioAffyProbetSetRecord chr
		ifTrue: [ ^ self position <= aBioAffyProbetSetRecord position ].
	self chr > aBioAffyProbetSetRecord chr
		ifTrue: [ ^ false ].
	self halt.
]

{ #category : #comparing }
BioAffyProbeSetRecord >> = aBioAffyProbetSetRecord [

	^ self chr = aBioAffyProbetSetRecord chr and: [ self position = aBioAffyProbetSetRecord position ]
]

{ #category : #accessing }
BioAffyProbeSetRecord >> chr [
	^ chr
]

{ #category : #accessing }
BioAffyProbeSetRecord >> chr: anObject [
	chr := anObject
]

{ #category : #comparing }
BioAffyProbeSetRecord >> hash [ 

	^ self chr hash bitXor: self position hash
]

{ #category : #accessing }
BioAffyProbeSetRecord >> id [
	^ id
]

{ #category : #accessing }
BioAffyProbeSetRecord >> id: anObject [
	id := anObject
]

{ #category : #accessing }
BioAffyProbeSetRecord >> markers [
	^ markers
]

{ #category : #accessing }
BioAffyProbeSetRecord >> markers: aCollection [

	markers := aCollection
	
]

{ #category : #accessing }
BioAffyProbeSetRecord >> position [
	^ position
]

{ #category : #accessing }
BioAffyProbeSetRecord >> position: anObject [
	position := anObject
]

{ #category : #printing }
BioAffyProbeSetRecord >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: self id;
		nextPutAll: self chr asString between: $[ and: $];
		nextPutAll: self position asString between: $[ and: $]
]
