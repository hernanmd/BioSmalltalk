Class {
	#name : 'BioReaction',
	#superclass : 'BioObject',
	#instVars : [
		'name',
		'products',
		'substrates',
		'catalyses'
	],
	#category : 'BioTools-Restriction',
	#package : 'BioTools',
	#tag : 'Restriction'
}

{ #category : 'accessing' }
BioReaction >> addCatalysis: aBioCatalysis [

	(self catalyses includes: aBioCatalysis) ifTrue: [ ^ self ].
	self catalyses add: aBioCatalysis.
	aBioCatalysis reaction == self ifFalse: [
		aBioCatalysis reaction: self ]
]

{ #category : 'accessing' }
BioReaction >> addProduct: aBioSequence [

	self products add: aBioSequence
]

{ #category : 'accessing' }
BioReaction >> addSubstrate: aBioSequence [

	self substrates add: aBioSequence
]

{ #category : 'accessing' }
BioReaction >> catalyses [

	^ catalyses ifNil: [ catalyses := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> catalyses: anObject [

	catalyses := anObject
]

{ #category : 'accessing' }
BioReaction >> enzymes [

	^ self catalyses collect: [ :each | each enzyme ]
]

{ #category : 'accessing' }
BioReaction >> name [

	^ name
]

{ #category : 'accessing' }
BioReaction >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
BioReaction >> products [

	^ products ifNil: [ products := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> products: anObject [

	products := anObject
]

{ #category : 'accessing' }
BioReaction >> substrates [

	^ substrates ifNil: [ substrates := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> substrates: anObject [

	substrates := anObject
]
