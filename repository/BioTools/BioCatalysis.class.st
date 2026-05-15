"
Represents a catalysis event involving an enzyme and a reaction. Links restriction enzymes to the biochemical reactions they catalyze. Instance Variables: enzyme <String> The enzyme name. reaction <BioReaction> The associated reaction. michaelisConstant <Number> The Michaelis constant for the enzyme-substrate pair.
"
Class {
	#name : 'BioCatalysis',
	#superclass : 'BioObject',
	#instVars : [
		'enzyme',
		'reaction',
		'michaelisConstant'
	],
	#category : 'BioTools-Restriction',
	#package : 'BioTools',
	#tag : 'Restriction'
}

{ #category : 'accessing' }
BioCatalysis >> enzyme [

	^ enzyme
]

{ #category : 'accessing' }
BioCatalysis >> enzyme: anEnzyme [

	enzyme := anEnzyme.
	anEnzyme addCatalysis: self
]

{ #category : 'accessing' }
BioCatalysis >> michaelisConstant [

	^ michaelisConstant
]

{ #category : 'accessing' }
BioCatalysis >> michaelisConstant: anObject [

	michaelisConstant := anObject
]

{ #category : 'accessing' }
BioCatalysis >> reaction [

	^ reaction
]

{ #category : 'accessing' }
BioCatalysis >> reaction: aReaction [

	reaction := aReaction.
	aReaction addCatalysis: self
]
