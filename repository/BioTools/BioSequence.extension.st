Extension { #name : 'BioSequence' }

{ #category : '*BioTools-Restriction' }
BioSequence >> digestWith: anEnzymeOrName [
	"Digest the receiver with an enzyme.
	anEnzymeOrName can be a BioRestrictionEnzyme or a Symbol/String representing its name."
	| enzyme |
	enzyme := anEnzymeOrName isString
		ifTrue: [ BioRestrictionEnzyme at: anEnzymeOrName ]
		ifFalse: [ anEnzymeOrName ].
	^ self digestWithEnzyme: enzyme
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
