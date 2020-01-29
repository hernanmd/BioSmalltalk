Class {
	#name : #BioMaterial,
	#superclass : #BioNamedObject,
	#instVars : [
		'location'
	],
	#category : #'BioSupport-Core'
}

{ #category : #accessing }
BioMaterial >> location [
	^ location
]

{ #category : #accessing }
BioMaterial >> location: anObject [
	location := anObject
]
