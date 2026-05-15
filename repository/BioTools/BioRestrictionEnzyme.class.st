"
Represents a restriction enzyme with its recognition site and cut positions. Instance Variables: site <String> Recognition sequence. cut3 <Integer> 3-prime cut position. cut5 <Integer> 5-prime cut position.
"
Class {
	#name : 'BioRestrictionEnzyme',
	#superclass : 'BioNamedObject',
	#instVars : [
		'site',
		'cut3',
		'cut5'
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

	| aBioRestrictionEnzyme |
	aBioRestrictionEnzyme := self new.

	^ aBioRestrictionEnzyme registry at: aName
]

{ #category : 'accessing' }
BioRestrictionEnzyme class >> register: anBioEnzyme [

	| aBioRestrictionEnzyme |
	aBioRestrictionEnzyme := self new.

	aBioRestrictionEnzyme registry at: anBioEnzyme name put: anBioEnzyme
]

{ #category : 'registry' }
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

{ #category : 'testing' }
BioRestrictionEnzyme >> isBlockedByMethylationAt: index in: aSequence [
	"Simple implementation: check if any base in the recognition site is methylated."

	0 to: self site size - 1 do: [ :i |
	(aSequence isMethylatedAt: index + i) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : 'testing' }
BioRestrictionEnzyme >> isBlunt [

	^ cut5 = cut3
]

{ #category : 'testing' }
BioRestrictionEnzyme >> matchesAt: index in: aSequence [

	| siteSize |
	siteSize := self site size.

	1 to: siteSize do: [ :i |
			| siteChar seqChar |
			siteChar := self site at: i.
			seqChar := aSequence at: index + i - 1.
			(self siteChar: siteChar matches: seqChar) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> overhangSize [

	^ (cut5 - cut3) abs
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> overhangType [
	"Answer #blunt, #fivePrime, or #threePrime"

	self isBlunt ifTrue: [ ^ #blunt ].
	^ cut5 < cut3
		  ifTrue: [ #fivePrime ]
		  ifFalse: [ #threePrime ]
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
						  ifTrue: [
								  stream
									  nextPut: $[;
									  nextPutAll: (map at: upperChar asString);
									  nextPut: $] ]
						  ifFalse: [ stream nextPut: upperChar ] ] ]
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> register: anBioEnzyme [ 
	^ self class register: anBioEnzyme 
]

{ #category : 'registry' }
BioRestrictionEnzyme >> registry [

	^ self class registry
]

{ #category : 'searching' }
BioRestrictionEnzyme >> searchIn: aSequence [
	"Search for sites in aSequence (can be BioSequence or BioCircularSequence)"

	| matches upperBound |
	matches := OrderedCollection new.

	"For linear sequences, we must not go beyond site size at the end.
	Circular sequences handle bounds via modulo in #at: so we search the full size."
	upperBound := aSequence isCircular
		              ifTrue: [ aSequence size ]
		              ifFalse: [ aSequence size - self site size + 1 ].

	1 to: upperBound do: [ :i |
	(self matchesAt: i in: aSequence) ifTrue: [ matches add: i ] ].
	^ matches
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> site [

	^ site
]

{ #category : 'accessing' }
BioRestrictionEnzyme >> site: anObject [

	site := anObject
]

{ #category : 'action' }
BioRestrictionEnzyme >> siteChar: siteChar matches: seqChar [

	| s c |
	s := siteChar asUppercase.
	c := seqChar asUppercase.
	s = c ifTrue: [ ^ true ].
	s = $N ifTrue: [ ^ true ].
	^ (BioSequence disambiguateLetter: s) includes: c
]
