Class {
	#name : 'BioReaction',
	#superclass : 'BioObject',
	#instVars : [
		'name',
		'substrates',
		'products',
		'catalyses'
	],
	#category : 'BioSupport-Core',
	#package : 'BioSupport',
	#tag : 'Core'
}

{ #category : 'accessing' }
BioReaction >> addCatalysis: aBioCatalysis [
	self catalyses add: aBioCatalysis
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
BioReaction >> substrates [
	^ substrates ifNil: [ substrates := OrderedCollection new ]
]
