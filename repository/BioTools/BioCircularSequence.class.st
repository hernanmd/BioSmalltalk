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

{ #category : 'testing' }
BioCircularSequence >> isCircular [
	^ true
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
BioCircularSequence >> digestWith: anEnzymeCollectionOrName [
	| enzymes |
	enzymes := (anEnzymeCollectionOrName isCollection and: [ anEnzymeCollectionOrName isString not ])
		ifTrue: [ anEnzymeCollectionOrName collect: [ :each | self resolveEnzyme: each ] ]
		ifFalse: [ OrderedCollection with: (self resolveEnzyme: anEnzymeCollectionOrName) ].
	^ self digestWithEnzymes: enzymes
]

{ #category : 'searching' }
BioCircularSequence >> resolveEnzyme: anEnzymeOrName [
	^ anEnzymeOrName isString
		ifTrue: [ BioRestrictionEnzyme at: anEnzymeOrName ]
		ifFalse: [ anEnzymeOrName ]
]

{ #category : 'searching' }
BioCircularSequence >> restrictionMapReportWith: aCollectionOfEnzymes [
	| enzymes |
	enzymes := aCollectionOfEnzymes collect: [ :each | self resolveEnzyme: each ].
	^ BioRestrictionMapFormatter new format: self enzymes: enzymes
]

{ #category : 'searching' }
BioCircularSequence >> digestWithEnzymes: aCollectionOfEnzymes [
	| allCutSites fragments |
	allCutSites := Set new.
	aCollectionOfEnzymes do: [ :enzyme |
		(enzyme searchIn: self) do: [ :siteIndex |
			allCutSites add: siteIndex + enzyme cut5 ] ].

	allCutSites isEmpty ifTrue: [ ^ OrderedCollection with: self sequence ].

	fragments := OrderedCollection new.
	allCutSites := allCutSites asSortedCollection asOrderedCollection.
	1 to: allCutSites size do: [ :i |
		| startCut endCut |
		startCut := allCutSites at: i.
		endCut := i < allCutSites size
			ifTrue: [ allCutSites at: i + 1 ]
			ifFalse: [ (allCutSites at: 1) + self size ].
		fragments add: (self copyFrom: startCut to: endCut - 1) ].
	^ fragments
]
