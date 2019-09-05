"
Implements an abstract class of recommended panels of markers.

BioPanel availablePanels.
"
Class {
	#name : #BioPanel,
	#superclass : #BioNamedObject,
	#classInstVars : [
		'table'
	],
	#category : #'BioTools-Repeats'
}

{ #category : #accessing }
BioPanel class >> availablePanels [
	" Answer a <Collection> of <String> of available panels "

	^ self subclasses collect: #panelName
]

{ #category : #accessing }
BioPanel class >> availableSpecies [
	" Answer a <Collection> of <String> of available species in the receiver "

	^ self markersForSpecies keys
]

{ #category : #accessing }
BioPanel class >> markersForSpeciesAt: speciesName [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ self markersForSpecies at: speciesName
]

{ #category : #accessing }
BioPanel class >> panelName [
	" Private - Answer a <String> with the panel name "
	
	^ self subclassResponsibility
]

{ #category : #accessing }
BioPanel class >> supportedMarkerTypes [
	" Answer a <Collection> of supported types of markers "
	
	self subclassResponsibility
]

{ #category : #accessing }
BioPanel class >> supportedSpecies [
	" Answer a <Collection> of <String> with species supported by the receiver "
	
	^ self markersForSpecies keys
]

{ #category : #accessing }
BioPanel class >> table [
	^ table
		ifNil: [ table := Dictionary new ]
]

{ #category : #accessing }
BioPanel class >> table: anObject [
	table := anObject
]
