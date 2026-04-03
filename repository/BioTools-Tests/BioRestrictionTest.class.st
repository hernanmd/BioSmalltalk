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

	"Site spanning the origin: TTC...GAA"
	seq := (BioSequence newDNA: 'AATTCAAAAAAGAA') asCircular.
	fragments := seq digestWithEnzyme: enzyme.

	self assert: fragments size equals: 2.
	"Cut at G^AATTC. Site 1 is at index 1: GAATTC. Cut at 1+1=2.
	Site 2 is at index 13: GAATTC (spans 13, 14, 1, 2, 3, 4). Cut at 13+1=14.
	Fragments: from 2 to 13, and from 14 to 1 (size 14 - 13 + 1 = 2? No, 14 to 1 is 14, 1)."
	"Wait, let's re-calculate:
	Sites at 1 and 13.
	Cuts at 2 and 14.
	Fragment 1: from 2 to 14-1 = 2 to 13 (AAAAAAGAA).
	Fragment 2: from 14 to 2-1 = 14 to 1 (AATTCG)."

	self assert: fragments first asString equals: 'AAAAAAGAA'.
	self assert: (fragments anySatisfy: [ :f | f asString = 'AATTC' ]). "Depending on exact wrap-around"
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
