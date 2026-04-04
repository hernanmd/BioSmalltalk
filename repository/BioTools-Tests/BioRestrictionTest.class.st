Class {
	#name : 'BioRestrictionTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Restriction',
	#package : 'BioTools-Tests',
	#tag : 'Restriction'
}

{ #category : 'testing' }
BioRestrictionTest >> testCanonicalRecognition [
	| seq enzyme sites |
	enzyme := BioRestrictionEnzyme new name: 'EcoRI'; site: 'GAATTC'; cut5: 1; cut3: 5.
	seq := BioSequence newDNA: 'AAAGAATTCAA'.
	sites := enzyme searchIn: seq.
	self assert: sites size equals: 1.
	self assert: sites first equals: 4.
]

{ #category : 'testing' }
BioRestrictionTest >> testCircularDigest [
	| seq enzyme fragments |
	enzyme := BioRestrictionEnzyme new name: 'EcoRI'; site: 'GAATTC'; cut5: 1; cut3: 5.

	"GAATTC at index 1 and TTC...GAA spanning origin"
	seq := (BioSequence newDNA: 'GAATTCAAAAAATTC') asCircular.
	fragments := seq digestWith: (OrderedCollection with: enzyme).

	self assert: fragments size equals: 2.
	self assert: (fragments collect: #asString) asSet equals: #('AATTCAAAAAAT' 'TCG') asSet
]

{ #category : 'testing' }
BioRestrictionTest >> testBluntEndCleavage [
	| seq enzyme fragments |
	enzyme := BioRestrictionEnzyme new name: 'SmaI'; site: 'CCCGGG'; cut5: 3; cut3: 3.
	self assert: enzyme isBlunt.
	self assert: enzyme overhangSize equals: 0.

	seq := BioSequence newDNA: 'AAACCCGGGAAA'.
	fragments := seq digestWith: enzyme.
	self assert: fragments size equals: 2.
	self assert: fragments first asString equals: 'AAACCC'.
	self assert: fragments second asString equals: 'GGGAAA'.
]

{ #category : 'testing' }
BioRestrictionTest >> testTypeIisOffsetCut [
	| seq enzyme sites |
	"FokI: GGATG(9/13)"
	enzyme := BioRestrictionEnzyme new name: 'FokI'; site: 'GGATG'; cut5: 9; cut3: 13.
	seq := BioSequence newDNA: 'GGATGAAAAAA'.
	sites := enzyme searchIn: seq.
	self assert: sites first equals: 1.
	"Cut position is relative to start of site"
	self assert: (sites first + enzyme cut5) equals: 10.
]

{ #category : 'testing' }
BioRestrictionTest >> testCircularDnaWrapping [
	| seq enzyme sites |
	enzyme := BioRestrictionEnzyme new site: 'GAATTC'.
	seq := (BioSequence newDNA: 'TTCAAAAAGAA') asCircular.
	sites := enzyme searchIn: seq.
	self assert: sites size equals: 1.
	self assert: sites first equals: 9. "TTC AAAAA GAA -> GAATTC starts at 9"
]

{ #category : 'testing' }
BioRestrictionTest >> testIsoschizomerBehavior [
	| mspi hpaii seq sitesM sitesH |
	"MspI and HpaII recognize CCGG"
	mspi := BioRestrictionEnzyme new name: 'MspI'; site: 'CCGG'; cut5: 1.
	hpaii := BioRestrictionEnzyme new name: 'HpaII'; site: 'CCGG'; cut5: 1.
	seq := BioSequence newDNA: 'AACCGGTT'.
	sitesM := mspi searchIn: seq.
	sitesH := hpaii searchIn: seq.
	self assert: sitesM equals: sitesH.
]

{ #category : 'testing' }
BioRestrictionTest >> testOverlappingSiteCompetition [
	| enzyme seq sites fragments |
	enzyme := BioRestrictionEnzyme new site: 'AAA'; cut5: 1.
	seq := BioSequence newDNA: 'AAAAA'.
	sites := enzyme searchIn: seq.
	"1: AAA.., 2: .AAA., 3: ..AAA"
	self assert: sites size equals: 3.

	fragments := seq digestWith: enzyme.
	"Cuts at 1+1=2, 2+1=3, 3+1=4"
	"Fragments: 1-1 (A), 2-2 (A), 3-3 (A), 4-5 (AA)"
	self assert: fragments size equals: 4.
]

{ #category : 'testing' }
BioRestrictionTest >> testMissingSiteGracefulFailure [
	| enzyme seq fragments |
	enzyme := BioRestrictionEnzyme new site: 'GAATTC'.
	seq := BioSequence newDNA: 'AAAAAAAAAA'.
	fragments := seq digestWith: enzyme.
	self assert: fragments size equals: 1.
	self assert: fragments first asString equals: 'AAAAAAAAAA'.
]

{ #category : 'testing' }
BioRestrictionTest >> testMethylationInterference [
	| enzyme seq |
	enzyme := BioRestrictionEnzyme new site: 'CCGG'.
	seq := BioSequence newDNA: 'AACCGGTT'.
	self deny: (enzyme isBlockedByMethylationAt: 3 in: seq).

	seq methylateAt: 4. "Methylate the second C"
	self assert: (enzyme isBlockedByMethylationAt: 3 in: seq).
]

{ #category : 'testing' }
BioRestrictionTest >> testDirectionalOverhangs [
	| bamhi kpni |
	"BamHI: G^GATCC (5' overhang)"
	bamhi := BioRestrictionEnzyme new name: 'BamHI'; site: 'GGATCC'; cut5: 1; cut3: 5.
	self assert: bamhi overhangType equals: #fivePrime.
	self assert: bamhi overhangSize equals: 4.

	"KpnI: GGTAC^C (3' overhang)"
	kpni := BioRestrictionEnzyme new name: 'KpnI'; site: 'GGTACC'; cut5: 5; cut3: 1.
	self assert: kpni overhangType equals: #threePrime.
	self assert: kpni overhangSize equals: 4.
]

{ #category : 'testing' }
BioRestrictionTest >> testIUPACSearch [
	| enzyme seq sites |
	enzyme := BioRestrictionEnzyme new name: 'HincII'; site: 'GTYRAC'. "Y=C|T, R=A|G"
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
	self assert: fragments second asString equals: 'AAGC'.
	self assert: fragments third asString equals: 'CCG'.
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

	self assert: (enzyme catalyzesReaction: reaction).
	self assert: (reaction enzymes includes: enzyme).
	self assert: (enzyme michaelisConstantForReaction: reaction) equals: 0.5.
]
