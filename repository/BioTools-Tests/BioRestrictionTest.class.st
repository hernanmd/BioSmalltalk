Class {
	#name : 'BioRestrictionTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Restriction',
	#package : 'BioTools-Tests',
	#tag : 'Restriction'
}

{ #category : 'testing' }
BioRestrictionTest >> testEcoRIDigest [
	| seq enzyme fragments |
	enzyme := BioRestrictionEnzyme new
		name: 'EcoRI';
		site: 'GAATTC';
		cut5: 1;
		cut3: 5;
		yourself.
	BioRestrictionEnzyme register: enzyme.

	seq := BioSequence newDNA: 'AAAAAGAATTCTTTTT'.
	fragments := seq digestWith: 'EcoRI'.

	self assert: fragments size equals: 2.
	self assert: fragments first asString equals: 'AAAAAG'.
	self assert: fragments second asString equals: 'AATTCTTTTT'.
]

{ #category : 'testing' }
BioRestrictionTest >> testCircularDigest [
	| seq enzyme fragments |
	enzyme := BioRestrictionEnzyme new
		name: 'EcoRI';
		site: 'GAATTC';
		cut5: 1;
		cut3: 5;
		yourself.

	"GAATTC at index 1 (GAATTC...) and spanning origin (TTC...GAA)"
	"Sequence: GAATTC AAAAAA TTC"
	"123456 789012 131415"
	seq := (BioSequence newDNA: 'GAATTCAAAAAATTC') asCircular.
	fragments := seq digestWithEnzymes: (OrderedCollection with: enzyme).

	self assert: fragments size equals: 2.
	"Sites: 1 (GAATTC), 13 (TTCGAA spanning origin)"
	"Cuts at 1+1=2 and 13+1=14"
	"Fragment 1: 2 to 13 -> AATTCAAAAAAT"
	"Fragment 2: 14 to 1 -> TC G"

	self assert: (fragments collect: #asString) asSet equals: #('AATTCAAAAAAT' 'TCG') asSet
]

{ #category : 'testing' }
BioRestrictionTest >> testManyToManyRelationship [
	| enzyme reaction catalysis |
	enzyme := BioEnzyme new name: 'TestEnzyme'.
	reaction := BioReaction new name: 'TestReaction'.
	catalysis := BioCatalysis new.
	catalysis enzyme: enzyme.
	catalysis reaction: reaction.
	catalysis michaelisConstant: 0.5.

	enzyme addCatalysis: catalysis.
	reaction addCatalysis: catalysis.

	self assert: (enzyme catalyzesReaction: reaction).
	self assert: (reaction enzymes includes: enzyme).
	self assert: (enzyme michaelisConstantForReaction: reaction) equals: 0.5.
]

{ #category : 'testing' }
BioRestrictionTest >> testIUPACSearch [
	| enzyme seq sites |
	enzyme := BioRestrictionEnzyme new
		name: 'HincII';
		site: 'GTYRAC'; "Y=C|T, R=A|G"
		yourself.

	seq := BioSequence newDNA: 'GTCGACGGGTTGAC'.
	sites := enzyme searchIn: seq.

	self assert: sites size equals: 2.
	self assert: (sites includes: 1).
	self assert: (sites includes: 9).
]

{ #category : 'testing' }
BioRestrictionTest >> testMultiEnzymeDigest [
	| seq enzymes fragments |
	enzymes := OrderedCollection new.
	enzymes add: (BioRestrictionEnzyme new name: 'E1'; site: 'AAA'; cut5: 1).
	enzymes add: (BioRestrictionEnzyme new name: 'E2'; site: 'CCC'; cut5: 1).

	seq := BioSequence newDNA: 'GAAAGCCCG'.
	fragments := seq digestWith: enzymes.

	self assert: fragments size equals: 3.
	self assert: fragments first asString equals: 'GA'.
	self assert: fragments second asString equals: 'AAGCC'.
	self assert: fragments third asString equals: 'CG'.
]

{ #category : 'testing' }
BioRestrictionTest >> testLinearBounds [
	| enzyme seq sites |
	enzyme := BioRestrictionEnzyme new site: 'GAATTC'.
	seq := BioSequence newDNA: 'GAATT'. "Too short"
	sites := enzyme searchIn: seq.
	self assert: sites isEmpty.

	seq := BioSequence newDNA: 'GAATTC'. "Exactly site size"
	sites := enzyme searchIn: seq.
	self assert: sites size equals: 1.
]
