"
Represents a restriction enzyme with its associated sequence pattern and catalysis information. Extends BioNamedObject to add sequence recognition and catalysis handling. Instance Variables: sequence <String> The recognition sequence. catalyses <Collection> Collection of BioCatalysis objects.
"
Class {
	#name : 'BioEnzyme',
	#superclass : 'BioNamedObject',
	#instVars : [
		'sequence',
		'catalyses'
	],
	#category : 'BioTools-Restriction',
	#package : 'BioTools',
	#tag : 'Restriction'
}

{ #category : 'accessing' }
BioEnzyme >> addCatalysis: aBioCatalysis [

	(self catalyses includes: aBioCatalysis) ifTrue: [ ^ self ].
	self catalyses add: aBioCatalysis.
	aBioCatalysis enzyme == self ifFalse: [ aBioCatalysis enzyme: self ]
]

{ #category : 'accessing' }
BioEnzyme >> catalyses [

	^ catalyses
		ifNil: [ catalyses := OrderedCollection new ]
]

{ #category : 'accessing' }
BioEnzyme >> catalyses: anObject [

	catalyses := anObject
]

{ #category : 'accessing' }
BioEnzyme >> catalyzesReaction: aBioReaction [

	^ self reactions includes: aBioReaction
]

{ #category : 'initialization' }
BioEnzyme >> initializeWithSequence: aBioSequence [

	(self assert: aBioSequence isProteinSequence)
		ifFalse: [ self error: 'Enzymes must be built from protein sequences' ].
	
	self sequence: aBioSequence.
	self catalyses: OrderedCollection new.
]

{ #category : 'accessing' }
BioEnzyme >> michaelisConstantForReaction: aBioReaction [

	^ (self catalyses 
			detect: [ :each | each reaction = aBioReaction ] 
			ifNone: [ ^ nil ]) michaelisConstant
]

{ #category : 'accessing' }
BioEnzyme >> reactions [

	^ self catalyses collect: [ :each | each reaction ]
]

{ #category : 'accessing' }
BioEnzyme >> sequence [

	^ sequence
]

{ #category : 'accessing' }
BioEnzyme >> sequence: anObject [

	sequence := anObject
]
