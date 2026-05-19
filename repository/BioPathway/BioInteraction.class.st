Class {
	#name : 'BioInteraction',
	#superclass : 'Object',
	#instVars : [
		'source',
		'target',
		'type',
		'label',
		'linkedReaction',
		'evidence'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'instance creation' }
BioInteraction class >> source: aSource target: aTarget type: aType [
	^ self new source: aSource; target: aTarget; type: aType; yourself
]

{ #category : 'adding' }
BioInteraction >> addEvidence: aString [
	self evidence add: aString
]

{ #category : 'accessing' }
BioInteraction >> evidence [
	^ evidence ifNil: [ evidence := OrderedCollection new ]
]

{ #category : 'testing' }
BioInteraction >> isActivation [
	^ type = #activation
]

{ #category : 'testing' }
BioInteraction >> isCatalysis [
	^ type = #catalysis
]

{ #category : 'testing' }
BioInteraction >> isInhibition [
	^ type = #inhibition
]

{ #category : 'testing' }
BioInteraction >> isRegulatory [
	^ type = #regulatory
]

{ #category : 'testing' }
BioInteraction >> isTransport [
	^ type = #transport
]

{ #category : 'accessing' }
BioInteraction >> label [
	^ label
]

{ #category : 'accessing' }
BioInteraction >> label: anObject [
	label := anObject
]

{ #category : 'accessing' }
BioInteraction >> linkedReaction [
	^ linkedReaction
]

{ #category : 'accessing' }
BioInteraction >> linkedReaction: aReaction [
	linkedReaction := aReaction
]

{ #category : 'printing' }
BioInteraction >> printOn: aStream [ super printOn: aStream. aStream nextPutAll: ' ('. source ifNotNil: [ aStream nextPutAll: source name asString; nextPutAll: ' -> ' ]. target ifNotNil: [ aStream nextPutAll: target name asString ]. type ifNotNil: [ aStream nextPutAll: ' '; nextPutAll: type asString ]. aStream nextPutAll: ')'
]

{ #category : 'accessing' }
BioInteraction >> source [
	^ source
]

{ #category : 'accessing' }
BioInteraction >> source: anObject [
	source := anObject
]

{ #category : 'accessing' }
BioInteraction >> target [
	^ target
]

{ #category : 'accessing' }
BioInteraction >> target: anObject [
	target := anObject
]

{ #category : 'accessing' }
BioInteraction >> type [
	^ type
]

{ #category : 'accessing' }
BioInteraction >> type: aSymbol [
	type := aSymbol
]
