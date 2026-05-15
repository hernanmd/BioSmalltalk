"
Test class for BioORF. Validates ORF creation coordinate mapping and strand behavior.
"
Class {
	#name : 'BioORFTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Core',
	#package : 'BioTools-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioORFTest >> testBioORFAccessors [
	"Test BioORF accessor methods"

	| orf |
	orf := BioORF
		       start: 10
		       end: 30
		       strand: 1
		       protein: 'MAST'.

	self assert: orf start equals: 10.
	self assert: orf end equals: 30.
	self assert: orf strand equals: 1.
	self assert: orf protein equals: 'MAST'.
	self assert: orf length equals: 21.
	self assert: orf proteinLength equals: 4.
	self assert: orf isForwardStrand.
	self deny: orf isReverseStrand
]

{ #category : 'tests' }
BioORFTest >> testForwardStrandFrame1 [
	"Test ORF in frame 1 of forward strand"

	| seq orfs orf |
	seq := BioSequence newDNA: 'ATGGCCTAATGA'.
	orfs := seq findOrfsWithTranslationTable: 1 minProteinLength: 1.

	"Should find ORF starting at frame 1 (position 2)"
	"Frame 1: TGG-CCT-AAT- = WPN, no stop, full length"
	orf := orfs
		       detect: [ :o | o strand = 1 and: [ o protein = 'WPN' ] ]
		       ifNone: [ nil ].
	self assert: orf notNil.
	self assert: orf start >= 2
]

{ #category : 'tests' }
BioORFTest >> testORFMinLength [
	"Test minimum protein length filter"

	| seq orfs |
	seq := BioSequence newDNA: 'ATGGCCTAATGA'.

	"With minLength 1, should find MA (length 2)"
	orfs := seq findOrfsWithTranslationTable: 1 minProteinLength: 1.
	self assert: (orfs anySatisfy: [ :o | o protein = 'MA' ]).

	"With minLength 3, MA should not be found"
	orfs := seq findOrfsWithTranslationTable: 1 minProteinLength: 3.
	self deny: (orfs anySatisfy: [ :o | o protein = 'MA' ])
]

{ #category : 'tests' }
BioORFTest >> testSimpleORF [
	"Test with simple sequence ATGGCCTAATGA (ATG-GCC-TAA-TGA)"

	| seq orfs orf |
	seq := BioSequence newDNA: 'ATGGCCTAATGA'.
	orfs := seq findOrfsWithTranslationTable: 1 minProteinLength: 1.

	"Should find ORFs on both strands"
	self assert: orfs notEmpty.

	"First ORF should be on forward strand starting at 1"
	orf := orfs detect: [ :o | o strand = 1 and: [ o start = 1 ] ].
	self assert: orf protein equals: 'MA'.
	self assert: orf end equals: 9
]

{ #category : 'tests' }
BioORFTest >> testSixFrameSearch [
	"Test that all six frames are searched"

	| seq orfs forwardCount reverseCount |
	seq := BioSequence newDNA: 'ATGAAATTTGGGTAATGAATGAAAGGGCCCTAG'.
	orfs := seq findOrfsWithTranslationTable: 1 minProteinLength: 2.

	"Should have ORFs on both strands"
	forwardCount := orfs count: [ :o | o strand = 1 ].
	reverseCount := orfs count: [ :o | o strand = -1 ].
	self assert: forwardCount > 0.
	self assert: reverseCount > 0
]
