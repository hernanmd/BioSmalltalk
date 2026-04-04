Class {
	#name : 'BioRestrictionTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Core',
	#package : 'BioTools-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioRestrictionTest >> testBluntEndCleavage [

	| seq enzyme fragments |
	enzyme := BioRestrictionEnzyme new
		          name: 'SmaI';
		          site: 'CCCGGG';
		          cut5: 3;
		          cut3: 3.
	self assert: enzyme isBlunt.
	self assert: enzyme overhangSize equals: 0.

	seq := BioSequence newDNA: 'AAACCCGGGAAA'.
	fragments := seq digestWith: enzyme.
	self assert: fragments size equals: 2.
	self assert: fragments first asString equals: 'AAACCC'.
	self assert: fragments second asString equals: 'GGGAAA'
]

{ #category : 'tests' }
BioRestrictionTest >> testCanonicalRecognition [

	| seq enzyme sites |
	enzyme := BioRestrictionEnzyme new
		          name: 'EcoRI';
		          site: 'GAATTC';
		          cut5: 1;
		          cut3: 5.
	seq := BioSequence newDNA: 'AAAGAATTCAA'.
	sites := enzyme searchIn: seq.
	self assert: sites size equals: 1.
	self assert: sites first equals: 4
]

{ #category : 'tests' }
BioRestrictionTest >> testCircularDigest [

	| seq enzyme fragments |
	enzyme := BioRestrictionEnzyme new
		          name: 'EcoRI';
		          site: 'GAATTC';
		          cut5: 1;
		          cut3: 5.

	"Site 1 at index 1: G^AATTC... (Cut at 2)"
	"Site 2 at index 13: G(13) A(14) A(15) T(1) T(2) C(3)... (Cut at 14)"
	seq := (BioSequence newDNA: 'GAATTCAAAAAAGAA') asCircular.
	fragments := seq digestWith: (OrderedCollection with: enzyme).

	self assert: fragments size equals: 2
]

{ #category : 'tests' }
BioRestrictionTest >> testCircularDnaWrapping [

	| seq enzyme sites |
	enzyme := BioRestrictionEnzyme new site: 'GAATTC'.
	seq := (BioSequence newDNA: 'TTCAAAAAGAA') asCircular.
	sites := enzyme searchIn: seq.
	self assert: sites size equals: 1.
	self assert: sites first equals: 9 "TTC AAAAA GAA -> GAATTC starts at 9"
]

{ #category : 'tests' }
BioRestrictionTest >> testDirectionalOverhangs [

	| bamhi kpni |
	"BamHI: G^GATCC (5' overhang)"
	bamhi := BioRestrictionEnzyme new
		         name: 'BamHI';
		         site: 'GGATCC';
		         cut5: 1;
		         cut3: 5.
	self assert: bamhi overhangType equals: #fivePrime.
	self assert: bamhi overhangSize equals: 4.

	"KpnI: GGTAC^C (3' overhang)"
	kpni := BioRestrictionEnzyme new
		        name: 'KpnI';
		        site: 'GGTACC';
		        cut5: 5;
		        cut3: 1.
	self assert: kpni overhangType equals: #threePrime.
	self assert: kpni overhangSize equals: 4
]

{ #category : 'tests' }
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
	self assert: fragments second asString equals: 'AATTCTTTTT'
]

{ #category : 'tests' }
BioRestrictionTest >> testIUPACSearch [

	| enzyme seq sites |
	enzyme := BioRestrictionEnzyme new
		          name: 'HincII';
		          site: 'GTYRAC'. "Y=C|T, R=A|G"
	seq := BioSequence newDNA: 'GTCGACGGGTTGAC'.
	sites := enzyme searchIn: seq.
	self assert: sites size equals: 2.
	self assert: (sites includes: 1).
	self assert: (sites includes: 9)
]

{ #category : 'tests' }
BioRestrictionTest >> testIsoschizomerBehavior [

	| mspi hpaii seq sitesM sitesH |
	"MspI and HpaII recognize CCGG"
	mspi := BioRestrictionEnzyme new
		        name: 'MspI';
		        site: 'CCGG';
		        cut5: 1.
	hpaii := BioRestrictionEnzyme new
		         name: 'HpaII';
		         site: 'CCGG';
		         cut5: 1.
	seq := BioSequence newDNA: 'AACCGGTT'.
	sitesM := mspi searchIn: seq.
	sitesH := hpaii searchIn: seq.
	self assert: sitesM equals: sitesH
]

{ #category : 'tests' }
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
	self
		assert: (enzyme michaelisConstantForReaction: reaction)
		equals: 0.5
]

{ #category : 'tests' }
BioRestrictionTest >> testMethylationInterference [

	| enzyme seq |
	enzyme := BioRestrictionEnzyme new site: 'CCGG'.
	seq := BioSequence newDNA: 'AACCGGTT'.
	self deny: (enzyme isBlockedByMethylationAt: 3 in: seq).

	seq methylateAt: 4. "Methylate the second C"
	self assert: (enzyme isBlockedByMethylationAt: 3 in: seq)
]

{ #category : 'tests' }
BioRestrictionTest >> testMissingSiteGracefulFailure [

	| enzyme seq fragments |
	enzyme := BioRestrictionEnzyme new site: 'GAATTC'.
	seq := BioSequence newDNA: 'AAAAAAAAAA'.
	fragments := seq digestWith: enzyme.
	self assert: fragments size equals: 1.
	self assert: fragments first asString equals: 'AAAAAAAAAA'
]

{ #category : 'tests' }
BioRestrictionTest >> testMultiEnzymeDigest [

	| seq enzymes fragments |
	enzymes := OrderedCollection new.
	enzymes add: (BioRestrictionEnzyme new
			 name: 'E1';
			 site: 'AAA';
			 cut5: 1).
	enzymes add: (BioRestrictionEnzyme new
			 name: 'E2';
			 site: 'CCC';
			 cut5: 1).

	seq := BioSequence newDNA: 'GAAAGCCCG'.
	fragments := seq digestWith: enzymes.

	self assert: fragments size equals: 3.
	self assert: fragments first asString equals: 'GA'.
	self assert: fragments second asString equals: 'AAGC'.
	self assert: fragments third asString equals: 'CCG'
]

{ #category : 'tests' }
BioRestrictionTest >> testOverlappingSiteCompetition [

	| enzyme seq sites fragments |
	enzyme := BioRestrictionEnzyme new
		          site: 'AAA';
		          cut5: 1.
	seq := BioSequence newDNA: 'AAAAA'.
	sites := enzyme searchIn: seq.
	"1: AAA.., 2: .AAA., 3: ..AAA"
	self assert: sites size equals: 3.

	fragments := seq digestWith: enzyme.
	"Cuts at 1+1=2, 2+1=3, 3+1=4"
	"Fragments: 1-1 (A), 2-2 (A), 3-3 (A), 4-5 (AA)"
	self assert: fragments size equals: 4
]

{ #category : 'tests' }
BioRestrictionTest >> testTypeIisOffsetCut [

	| seq enzyme sites |
	"FokI: GGATG(9/13)"
	enzyme := BioRestrictionEnzyme new
		          name: 'FokI';
		          site: 'GGATG';
		          cut5: 9;
		          cut3: 13.
	seq := BioSequence newDNA: 'GGATGAAAAAA'.
	sites := enzyme searchIn: seq.
	self assert: sites first equals: 1.
	"Cut position is relative to start of site"
	self assert: sites first + enzyme cut5 equals: 10
]
