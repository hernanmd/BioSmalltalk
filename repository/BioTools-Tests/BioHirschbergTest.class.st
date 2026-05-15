"
Test class for BioHirschberg. Validates Hirschberg sequence alignment algorithm behavior including gap penalties and scoring.
"
Class {
	#name : 'BioHirschbergTest',
	#superclass : 'TestCase',
	#category : 'BioTools-Tests-Align',
	#package : 'BioTools-Tests',
	#tag : 'Align'
}

{ #category : 'tests' }
BioHirschbergTest >> testAlignEmptyWithEmpty [
	| result |
	result := BioHirschberg new align: '' with: ''.
	self assert: result firstSequence equals: ''.
	self assert: result secondSequence equals: ''.
]

{ #category : 'tests' }
BioHirschbergTest >> testAlignEmptyWithNonEmpty [
	| result |
	result := BioHirschberg new align: '' with: 'GATTACA'.
	self assert: result firstSequence equals: '-------'.
	self assert: result secondSequence equals: 'GATTACA'.
]

{ #category : 'tests' }
BioHirschbergTest >> testAlignIdenticalSequences [
	| result |
	result := BioHirschberg new align: 'ACGTACGT' with: 'ACGTACGT'.
	self assert: result firstSequence equals: 'ACGTACGT'.
	self assert: result secondSequence equals: 'ACGTACGT'.
]

{ #category : 'tests' }
BioHirschbergTest >> testAlignNonEmptyWithEmpty [
	| result |
	result := BioHirschberg new align: 'GATTACA' with: ''.
	self assert: result firstSequence equals: 'GATTACA'.
	self assert: result secondSequence equals: '-------'.
]

{ #category : 'tests' }
BioHirschbergTest >> testAlignSingleCharacterMismatch [

	| result |
	result := BioHirschberg new align: 'A' with: 'T'.
	self assert: result firstSequence size equals: 1.
	self assert: result secondSequence size equals: 1.
	self assert: result firstSequence equals: 'A'.
	self assert: result secondSequence equals: 'T'
]

{ #category : 'tests' }
BioHirschbergTest >> testBaseCaseManyAgainstOne [

	| result |
	result := BioHirschberg new align: 'GATTACA' with: 'A'.
	self
		assert: result firstSequence size
		equals: result secondSequence size.
	self assert: (result secondSequence occurrencesOf: $A) equals: 1
]

{ #category : 'tests' }
BioHirschbergTest >> testBaseCaseOneAgainstMany [

	| result |
	result := BioHirschberg new align: 'A' with: 'GATTACA'.
	self
		assert: result firstSequence size
		equals: result secondSequence size.
	self assert: (result firstSequence occurrencesOf: $A) equals: 1
]

{ #category : 'tests' }
BioHirschbergTest >> testOnlyGapCharacterInsertedForPadding [

	| result allowed |
	result := BioHirschberg new align: 'GAT' with: 'GATTACA'.
	allowed := (Set withAll: 'GATTACA') , (Set with: $-).
	self assert:
		(result firstSequence allSatisfy: [ :ch | allowed includes: ch ]).
	self assert:
		(result secondSequence allSatisfy: [ :ch | allowed includes: ch ])
]

{ #category : 'tests' }
BioHirschbergTest >> testResultSequencesHaveSameLength [

	| result |
	result := BioHirschberg new align: 'GATTACA' with: 'GCATGCU'.
	self
		assert: result firstSequence size
		equals: result secondSequence size
]

{ #category : 'tests' }
BioHirschbergTest >> testSequencesWithGaps [

	| result |
	result := BioHirschberg new align: 'GATTACA' with: 'GAATACA'.
	self assert: (result firstSequence includesSubstring: '-').
	self assert: (result secondSequence includesSubstring: '-')
]

{ #category : 'tests' }
BioHirschbergTest >> testSequencesWithRepeatedGaps [

	| result |
	result := BioHirschberg new align: 'G--A' with: 'GA--'.

	"Alignments should be of equal length"
	self
		assert: result firstSequence size
		equals: result secondSequence size.
	"Alignment contains gaps as expected"
	self assert: (result firstSequence includesSubstring: '-')
]
