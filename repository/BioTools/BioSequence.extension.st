Extension { #name : 'BioSequence' }

{ #category : '*BioTools-Restriction' }
BioSequence >> digestWith: anEnzymeCollectionOrName [
	"Digest the receiver with one or more enzymes.
	anEnzymeCollectionOrName can be a BioRestrictionEnzyme, a String name, or a Collection of these."
	| enzymes |
	enzymes := (anEnzymeCollectionOrName isCollection and: [ anEnzymeCollectionOrName isString not ])
		ifTrue: [ anEnzymeCollectionOrName collect: [ :each | self resolveEnzyme: each ] ]
		ifFalse: [ OrderedCollection with: (self resolveEnzyme: anEnzymeCollectionOrName) ].
	^ self digestWithEnzymes: enzymes
]

{ #category : '*BioTools-Restriction' }
BioSequence >> resolveEnzyme: anEnzymeOrName [
	^ anEnzymeOrName isString
		ifTrue: [ BioRestrictionEnzyme at: anEnzymeOrName ]
		ifFalse: [ anEnzymeOrName ]
]

{ #category : '*BioTools-Restriction' }
BioSequence >> digestWithEnzymes: aCollectionOfEnzymes [
	"Digest the receiver with multiple enzymes and answer a Collection of fragments."
	| allSites fragments lastIndex |
	allSites := Set new.
	aCollectionOfEnzymes do: [ :enzyme |
		(enzyme searchIn: self) do: [ :siteIndex |
			allSites add: siteIndex + enzyme cut5 ] ].

	allSites isEmpty ifTrue: [ ^ OrderedCollection with: self ].

	fragments := OrderedCollection new.
	lastIndex := 1.
	allSites asSortedCollection do: [ :cutIndex |
		fragments add: (self copyFrom: lastIndex to: cutIndex - 1).
		lastIndex := cutIndex ].
	fragments add: (self copyFrom: lastIndex to: self size).
	^ fragments
]

{ #category : '*BioTools-Restriction' }
BioSequence >> digestWithEnzyme: anEnzyme [
	"Digest the receiver with an enzyme and answer a Collection of fragments."
	| sites fragments lastIndex |
	sites := anEnzyme searchIn: self.
	sites isEmpty ifTrue: [ ^ OrderedCollection with: self ].

	fragments := OrderedCollection new.
	lastIndex := 1.
	sites do: [ :siteIndex |
		| cutIndex |
		"1-based indexing. siteIndex is the start of the recognition site.
		cut5 is the offset from the start of the site to the cut position."
		cutIndex := siteIndex + anEnzyme cut5.
		fragments add: (self copyFrom: lastIndex to: cutIndex - 1).
		lastIndex := cutIndex ].
	fragments add: (self copyFrom: lastIndex to: self size).
	^ fragments
]

{ #category : '*BioTools-Restriction' }
BioSequence >> asCircular [
	^ BioCircularSequence on: self
]

{ #category : '*BioTools-Restriction' }
BioSequence >> restrictionMapReportWith: aCollectionOfEnzymes [
	| enzymes |
	enzymes := aCollectionOfEnzymes collect: [ :each | self resolveEnzyme: each ].
	^ BioRestrictionMapFormatter new format: self enzymes: enzymes
]
