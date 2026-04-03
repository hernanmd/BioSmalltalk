Class {
	#name : 'BioRestrictionEnzyme',
	#superclass : 'BioEnzyme',
	#instVars : [
		'site',
		'cut5',
		'cut3'
	],
	#classVars : [
		'Registry'
	],
	#category : 'BioTools-Restriction',
	#package : 'BioTools',
	#tag : 'Restriction'
}

{ #category : 'accessing' }
BioRestrictionEnzyme class >> at: aName [
	^ self registry at: aName
]

{ #category : 'accessing' }
BioRestrictionEnzyme class >> register: anEnzyme [
	self registry at: anEnzyme name put: anEnzyme
]

{ #category : 'accessing' }
BioRestrictionEnzyme class >> registry [
	^ Registry ifNil: [ Registry := Dictionary new ]
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> cut3 [
	^ cut3
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> cut3: anObject [
	cut3 := anObject
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> cut5 [
	^ cut5
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> cut5: anObject [
	cut5 := anObject
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> site [
	^ site
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> site: aString [
	site := aString
]

{ #category : 'searching' }
BioRestrictionEnzyme >> regexPattern [
	"Convert IUPAC site to regex pattern"
	| map |
	map := BioIUPACAmbiguousDNA ambiguousLettersMap.
	^ String streamContents: [ :stream |
		self site do: [ :char |
			| upperChar |
			upperChar := char asUppercase.
			(map includesKey: upperChar asString)
				ifTrue: [ stream nextPut: $[; nextPutAll: (map at: upperChar asString); nextPut: $] ]
				ifFalse: [ stream nextPut: upperChar ] ] ]
]

{ #category : 'searching' }
BioRestrictionEnzyme >> searchIn: aSequence [
	"Search for sites in aSequence (can be BioSequence or BioCircularSequence)"
	| pattern matches |
	pattern := self regexPattern.
	matches := OrderedCollection new.

	"Note: Pharo doesn't have a native Regex that returns all matches with indices easily in some versions,
	but BioSmalltalk often uses extensions or specific parsers.
	For the sake of this implementation, we will use a simplified manual search if regex is tricky,
	but here we assume a standard regex search or manual IUPAC expansion."

	"Simplified manual search for IUPAC"
	1 to: aSequence size do: [ :i |
		(self matchesAt: i in: aSequence) ifTrue: [ matches add: i ] ].
	^ matches
]

{ #category : 'searching' }
BioRestrictionEnzyme >> matchesAt: index in: aSequence [
	| siteSize seqSize |
	siteSize := self site size.
	seqSize := aSequence size.

	1 to: siteSize do: [ :i |
		| siteChar seqChar |
		siteChar := self site at: i.
		seqChar := aSequence at: index + i - 1.
		(self siteChar: siteChar matches: seqChar) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'searching' }
BioRestrictionEnzyme >> siteChar: siteChar matches: seqChar [
	| s c map |
	s := siteChar asUppercase.
	c := seqChar asUppercase.
	s = c ifTrue: [ ^ true ].
	s = $N ifTrue: [ ^ true ].
	map := BioIUPACAmbiguousDNA ambiguousLettersMap.
	(map includesKey: s asString) ifTrue: [
		^ (map at: s asString) includes: c ].
	^ false
]
