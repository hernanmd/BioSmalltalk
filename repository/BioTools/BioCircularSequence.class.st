"
Represents a circular (non-linear) DNA sequence such as a plasmid or mitochondrial genome. Supports circular-specific operations like rotation and position wrapping. Instance Variables: sequence <String> The circular sequence string.
"
Class {
	#name : 'BioCircularSequence',
	#superclass : 'BioObject',
	#instVars : [
		'sequence'
	],
	#category : 'BioTools-Restriction',
	#package : 'BioTools',
	#tag : 'Restriction'
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
	^ sequence at: anIndex - 1 \\ size + 1
]

{ #category : 'copying' }
BioCircularSequence >> copyFrom: start to: stop [

	^ String streamContents: [ :stream |
		  start to: stop do: [ :i | stream nextPut: (self at: i) ] ]
]

{ #category : 'accessing' }
BioCircularSequence >> digestWith: anEnzymeCollectionOrName [

	| enzymes |
	enzymes := (anEnzymeCollectionOrName isCollection and: [
		            anEnzymeCollectionOrName isString not ])
		           ifTrue: [
			           anEnzymeCollectionOrName collect: [ :each |
				           self resolveEnzyme: each ] ]
		           ifFalse: [
			           OrderedCollection with:
				           (self resolveEnzyme: anEnzymeCollectionOrName) ].
	^ self digestWithEnzymes: enzymes
]

{ #category : 'accessing' }
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
				          ifFalse: [ sites first + anEnzyme cut5 + self size ].
			fragments add: (self copyFrom: startCut to: endCut - 1) ].
	^ fragments
]

{ #category : 'accessing' }
BioCircularSequence >> digestWithEnzymes: aCollectionOfEnzymes [
	"Answer the fragments produced by digesting the receiver with all enzymes in aCollectionOfEnzymes.
	 Both the 5' cut (cut5) and the 3' cut (cut3) are taken into account for each recognition site.
	 This is required for staggered cutters on circular DNA."

	| allCutSites fragments |

	"Set automatically removes duplicate cut positions (blunt cutters)"
	allCutSites := Set new.

	aCollectionOfEnzymes do: [ :enzyme |
			allCutSites addAll:
				((enzyme searchIn: self) flatCollect: [ :siteIndex |
						 OrderedCollection
							 with: siteIndex + enzyme cut5
							 with: siteIndex + enzyme cut3 ]) ].

	allCutSites isEmpty ifTrue: [
		^ OrderedCollection with: self sequence ].

	fragments := OrderedCollection new.
	allCutSites := allCutSites asSortedCollection asOrderedCollection.

	1 to: allCutSites size do: [ :i |
			| startCut endCut |
			startCut := allCutSites at: i.
			endCut := i < allCutSites size
				          ifTrue: [ allCutSites at: i + 1 ]
				          ifFalse: [ allCutSites first + self size ].
			fragments add: (self copyFrom: startCut to: endCut - 1) ].

	^ fragments
]

{ #category : 'accessing' }
BioCircularSequence >> indicesOfSubstring: aString [
	"Search for aString in the circular sequence.
	We search in sequence + sequence(1 to: aString size - 1) to cover wrap-around."

	| searchString size sites |
	size := sequence size.
	searchString := sequence asString
	                ,
	                (sequence asString
		                 copyFrom: 1
		                 to: (aString size - 1 min: size)).
	sites := searchString indicesOfSubstring: aString.
	^ sites select: [ :each | each <= size ]
]

{ #category : 'testing' }
BioCircularSequence >> isCircular [

	^ true
]

{ #category : 'testing' }
BioCircularSequence >> isMethylatedAt: index [

	^ sequence isMethylatedAt: index - 1 \\ self size + 1
]

{ #category : 'accessing' }
BioCircularSequence >> resolveEnzyme: anEnzymeOrName [

	^ anEnzymeOrName isString
		  ifTrue: [ BioRestrictionEnzyme at: anEnzymeOrName ]
		  ifFalse: [ anEnzymeOrName ]
]

{ #category : 'accessing' }
BioCircularSequence >> restrictionMapReportWith: aCollectionOfEnzymes [

	| enzymes |
	enzymes := aCollectionOfEnzymes collect: [ :each | self resolveEnzyme: each ].
	^ BioRestrictionMapFormatter new format: self enzymes: enzymes
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

	^ self sequence size
]
