Class {
	#name : 'BioCircularSequence',
	#superclass : 'BioObject',
	#instVars : [
		'sequence'
	],
	#category : 'BioTools-Sequences',
	#package : 'BioTools',
	#tag : 'Sequences'
}

{ #category : 'instance creation' }
BioCircularSequence class >> on: aBioSequence [
	^ self new
		sequence: aBioSequence;
		yourself
]

{ #category : 'accessing' }
BioCircularSequence >> at: anIndex [
	| size |
	size := sequence size.
	^ sequence at: ((anIndex - 1) \\ size) + 1
]

{ #category : 'copying' }
BioCircularSequence >> copyFrom: start to: stop [
	| size result |
	size := sequence size.
	result := String new: (stop - start + 1).
	start to: stop do: [ :i |
		result at: (i - start + 1) put: (self at: i) ].
	^ sequence class newWith: result alphabet: sequence alphabet
]

{ #category : 'accessing' }
BioCircularSequence >> sequence [
	^ sequence
]

{ #category : 'accessing' }
BioCircularSequence >> sequence: anObject [
	sequence := anObject
]

{ #category : 'accessing' }
BioCircularSequence >> size [
	^ sequence size
]

{ #category : 'searching' }
BioCircularSequence >> indicesOfSubstring: aString [
	"Search for aString in the circular sequence.
	We search in sequence + sequence(1 to: aString size - 1) to cover wrap-around."
	| searchString size sites |
	size := sequence size.
	searchString := sequence asString , (sequence asString copyFrom: 1 to: (aString size - 1 min: size)).
	sites := searchString indicesOfSubstring: aString.
	^ sites select: [ :each | each <= size ]
]

{ #category : 'searching' }
BioCircularSequence >> digestWith: anEnzymeOrName [
	| enzyme |
	enzyme := anEnzymeOrName isString
		ifTrue: [ BioRestrictionEnzyme at: anEnzymeOrName ]
		ifFalse: [ anEnzymeOrName ].
	^ self digestWithEnzyme: enzyme
]

{ #category : 'searching' }
BioCircularSequence >> digestWithEnzyme: anEnzyme [
	| sites fragments |
	sites := anEnzyme searchIn: self.
	sites isEmpty ifTrue: [ ^ OrderedCollection with: self sequence ].

	fragments := OrderedCollection new.
	1 to: sites size do: [ :i |
		| startCut endCut |
		startCut := (sites at: i) + anEnzyme cut5.
		endCut := i < sites size
			ifTrue: [ (sites at: i + 1) + anEnzyme cut5 ]
			ifFalse: [ (sites at: 1) + anEnzyme cut5 + self size ].
		fragments add: (self copyFrom: startCut to: endCut - 1) ].
	^ fragments
]
