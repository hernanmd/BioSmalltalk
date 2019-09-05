Class {
	#name : #BioSequenceTest,
	#superclass : #BioAbstractSequenceTest,
	#category : 'BioToolsTests-Biological'
}

{ #category : #accessing }
BioSequenceTest >> alphabetClass [

	^ BioAlphabet
]

{ #category : #testing }
BioSequenceTest >> testAlphabet [

	self assert: ( self sequence alphabet isKindOf: BioAlphabet )
]

{ #category : #testing }
BioSequenceTest >> testAmbiguityCodes [

	sequence := BioSequence newAmbiguousDNA: String empty.

	self deny: sequence ambiguityCodes isNil.
	self deny: sequence ambiguityCodes isEmpty.
	self assert: (sequence ambiguityCodes includes: $N).

	sequence := BioSequence newProtein: String empty.

	self deny: sequence ambiguityCodes isNil.
	self deny: sequence ambiguityCodes isEmpty.
	self assert: (sequence ambiguityCodes includes: $X).

	sequence := BioSequence newAmbiguousRNA: String empty.

	self deny: sequence ambiguityCodes isNil.
	self deny: sequence ambiguityCodes isEmpty.
	self assert: (sequence ambiguityCodes includes: $N).
]

{ #category : #testing }
BioSequenceTest >> testAsLowercase [

	self assert: (self sequence asLowercase asString allSatisfy: [: car | car isLowercase ]).	
]

{ #category : #testing }
BioSequenceTest >> testAsNumber [

	self assert: ('AGT' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 12.
	self assert: ('GT' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 12.
	self assert: ('ATGCAA' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 913.
	self assert: ('GGCGGTTGCACCAGATGA' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 44759798329.
]

{ #category : #testing }
BioSequenceTest >> testAsString [

	| seqString |
	
	seqString := self sequence asString.
	self assert: (seqString  isKindOf: String).
	self assert: self sequence size equals: seqString size.
	self assert: (self sequence instVarNamed: #seq) equals: seqString.

]

{ #category : #testing }
BioSequenceTest >> testAsUppercase [

	self assert: (self sequence asUppercase asString allSatisfy: [: car | car isUppercase ]).

]

{ #category : #testing }
BioSequenceTest >> testAt [

	self assert: (self sequence at: 2) equals: $A.
	self assert: (self sequence at: 3) equals: $G.
	self should: [ self sequence at: 600 ] raise: BioErrorSpecificationObject.



]

{ #category : #testing }
BioSequenceTest >> testBuildFrequencies [

	self assert: ((('ACGCGGCTCTGAAA' asSequence alphabet: BioDNAAlphabet new) buildFrequencies: 2) hasEqualElements: #(2 1 0 0 0 0 2 2 1 2 1 0 0 1 1 0)).
	self assert: ((('AAAAC' asSequence alphabet: BioDNAAlphabet new) buildFrequencies: 2) hasEqualElements: #(3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0)).
	self assert: ((('TTAAA' asSequence alphabet: BioDNAAlphabet new) buildFrequencies: 2) hasEqualElements: #(2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1)).
	self assert: ((('AAA' asSequence alphabet: BioDNAAlphabet new) buildFrequencies: 2) hasEqualElements: #(2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)).	
	self assert: ((('ACTTCGCCTAAGTCATTTATCCCGTGGTACGACGCTCCCTTACAGTCTTATATCCCGGTATATACGCAGAAATGCCTACGTCCCCTCGTCCCACACACCAGGGAAGCTGAAATCGCTCATCTACTATGCGTGTACTTCCGGACGAAATCGTCGTCGGCTTCTGTCTGGCGCTGGAGATCCGGGCTTCTTGAGGGACACACCCATTATGACCGTTACAGGACTTACAACTACTCTGAGCAATGATGGTGCTCTGTAACGAACAAACGCACTCACCTCTGTTTCCTGTATGACATCCTCAAATGGATCGACCGTGATGTACTGAGCGAATAAGTGCGGATTACATTTATAGTCAGCTACATTTATTCGCCGCTCGGAGCAGAGTATAATGAATTTATACCACTTGTTAGACTCCTTCTCGCATTTAGCCCCTACCGCAAGTCGGAGCGTTGGGGTGCAATAGAGTTTTCAGTATCTACGTACCGTTAAGTCTCTCGCGTTCTTTCAGCAGGCATCAATATGTTGCTTGCTGTGGGGTCGGGTGGGGCGGAGAGCCAATAAAGTGCATCGGAATTGGCTGCCCTCCTACGAATCCGCAAGATGCGGTGATGCTACGTGATTATGACTACTAGCTTAGTCCC' asSequence alphabet: BioDNAAlphabet new) buildFrequencies: 6) hasEqualElements: #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 2 0 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 2 0 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 2 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 2 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 1 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 1 0 1 0 0 0 0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 1 1 0 0 1 0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 2 0 0 0 0 0 1 0 0 1 2 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 1 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 1 1 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 3 2 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 1 0 1 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 1 0 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 0 2 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 1 0 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0 0 2 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 1 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 1 0 0 1 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 2 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 2 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0 0 2 0 0 0 0 0 0 1 0 0 0 0 3 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 1 1 0 0 0 1 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 1 0 1 0 0 1 0 2 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1 0 0 1 1 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 2 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 2 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 1 1 1 0 1 0 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 1 0 1 0 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0))
]

{ #category : #testing }
BioSequenceTest >> testClumpFindKLengthTimes [

	self assert: (('GATCAGCATAAGGGTCCCTGCAATGCATGACAAGCCTGCAGTTGTTTTAC' asSequence clumpFindK: 4 length: 25 times: 3) asArray hasEqualElements: #('TGCA')).
	self assert: (('CCTAGCACGGGTACACACCCCTCGGGTGACTGTGTTCCCTACTAATGGAGTAATCGAATAAAGTAGTATGTGAAATCACCAATACTTTCAGTGTTTCATGCATGCCTGAATTTCATTTACGGCAAGCTAACATCGATGTTTTGGTAGATGAGACACTGCACACACGATAAACTAGACGGAGCTGGCAGACGTCAATATGTAACCCAGTAATACGGTTATCACCGAGGTTTGTTAATAACGATAATTGTCCCTTGTCTGGGGTTGCCGCGCCAGCCTGGAACGTGAAATCCGCCTCCGACCTGAAATCCGCTCGAAATCCGCCTCTGCGAAATCCGCCCCCGAAATCCGGAAATCCGCGGTCCGACCTCCGACCTCTCATTCAGAAATCCGCCGGAGAGAGCTTCCGGTCTCAACGAGAGCCACGAGAGCCCCGACGAGAGCCAGAACGAGAGCCGAAATCCGACGACGAGAGCCGCCCCTCAGAAATCCGCTGTTTAAAACGAGAGCCGACACGAGAGCCCCTCCGATCCGACTCCACGAGAGCCCGCAAATCACGAACGAGAGCCCCTCATCCGCCCCAAGCCAAGTTGGTCCGACCTCTCGTTTGTAACAGAAATACGCCAAGTTGGCGAGAGCCGCCGACCGCCAAGTTGGGAGAGCCACCAAGCCAAGTTGGCAAGTTGGCAAGTTGGCCTGGAAAGAACGAGAGCCAAGTCCAAGTTGGCGATTTAATAGTACGAGAGCCCAATCCGCTACATACACGAGCCAAGTTGGTCCGCGACGAGAGCCAAATCCGCCGACCTCTGGCAGTCGGTTTCCGACCTACGAGAGCCGACGAGAACGAGAGCCATCCCCAAGTTGGAGACGACCAAGTTGGCCCCACGAGAGCCACGACCCAAGTTGGGAAAATACCCAAGCCAAGTTGCCAAGTTGGAAGTTGGAGTTGGAGTTGGGAGAGCCTTCCAAGTTGGAGTTGGAGTGAGAGTTCCGAGGCACCTGCTAAAATCTCCCAAGTTGGGGCACCACCAAGTTCCAAGTTGGTGCCAAGTTGGTGACGCTCACATCCAACCAAGTTGGCCCAAGTTGGTAACCAAGTTGGGCGTAGTCAAACGCCGTATTGCCGTATTCGTTGGCCGTATTCAGCTTCGCCGCCGTATTCCAGCGCCGTATTCTATTCATTCGCTTGATCTACAGGGGATTTAACGAGTCCGCCGTATTCCTCTGATTCAGACGTTTAGGCAACAGCCAACCTGCAAGGCCGTATTCTAACGCCGTGCCGTAGCCGTATTCTGGTATAGTGGGCCGACAGGAGCCGTATTCAATCCCCTAGAAGCACTGCCGTAGCCGTATTCGATATGGTCGATGTGCCGTATTCATTCATCATTGCCGTATTCCGCCGTATTCCCGATGCCGTATTCAGCCGTATTCTCTTGGCCGTATTCGTTGTACGCCGTATTCTTTATTATTTGCGCCGCCGTATTCGTATTCTCTTCAATCATAACGGGCGCCGTATTCCCGTCAAGTGACTTATAGGCCGTATTCCCTATCAAGGCAAGGCTACCCTTATTTAAAGCCACCGGCCGCCGTATTCCCAATACTTAGGGCTGTGGGTCGAGGCCGTATTCGCCGTATTCTGAATCAAAAGGAGATTCTTCTCTTGACGCACTCTACACAGTTACTCGAGTCAGCCGTATTCATTCAATTCGCCACAATATCAATGCGACGGTTTTGTTAGTCCAGCAAGACCAATGTCGTTCATGATATCCTTTAAAAGACGGTCCGATACCTTTAAAAACCTTTAAAACTTTCCTTTAAAAACTTACCATAGGCTAGCCCATTGAGACTCCTTTCCTTTAAAACTGAGCCTTTAAAAAAAACCTTTAAAAGCAGCATCCCCTTTAAAACTTTAAAAAACCCCCTTTAAAACGTGTCCCTCCCTTTAAAAATCTCACGAGCTCTCGTACCGCAACCTTTAAAATGCCCCTTTAAAATGCCTTTAAAATGCCTTTAAAATGGCCTTTAAAAACCCTTTAAAAGAGACATTAGTGGTTGCTAAAAGTGGTTGCGGTTGCTCAGTGGTTGCGTTTGAGTGGTTGCGGTAGTGGTTGCCTTTAAAATTGGCGAAGCTACATCCCTTTAAAAGTGGTTGCCCACCTGCCTACAGCGTTAGTAGTAGTGGTTGCTTCAGTTAGTGGTTGCTTCTTAGTGGTTGCGATGGCACCTTTAAAATAAAAAGTGGTTGCCCAGTGGTTGCCTTAGTGGTTGCATTTAAAACGCGGTAAGCCTTTAAAAAAGTGGTTGCACAACCTGCCTACCTTTAAAATTAAAATGAAAGGCCTTTAAAGAGTGGTAGTGGTTGCGTTGCATATACGAGTGGTTGCAGTGGTTGCTCTCAACGAAGTGGTTGCTGCACCCCATAAGTGGTTGCGGTGAGGTGTCCCAGTGGTTGCCATCTAGCAAGTGGTTGCATCTAAAACGGCGTTAGTGGTAGTGGTTGCATGCGTGGCCAATAATGCGTGACGCGGCAGTGGTTGCATGCGTGCGTGACCAAGATGGATTAATGCTAATGCGTGCAGTGGTTGCGGCCTGTAATACTTGCGCTAGTGGTTGCTGTAATTAAAGTGGTTGCGTGATAATGCGTTAATGCGTGGACGATGGTCCGGTTAATGCGTGCCTGACATGAAAGCTGCTAATGCGTGCATAAAGTTGTCCCCACCCGTATCGCGCCGATTGTAATGCGTGGGTGGTTTGGTCTTGCCGCTCCGACCGAGTATTCCATGCGATAATGGTGAAGATAATGCGTGATTGTGCTAATGCGTGGTGTGGGACGTCTTTGGAGGTTTGGGAATTGAATAGTTCATCATCCTGATATTATAATGCGTGGCAAGTAATGCGTGATGCGTGTAATGCGTGTATGAGGAGCTAATGCGTGGTATAATTAATGCGTGATGCGTGTAATGCGTGGTCTAATGCGTGACCGTTCATATTTCCGTCGTGAGGCCAAGTTGATGCACGTACGGCAGTAATGCGTGTGCGTGCGTACTTCATTTGTCCTTAATGCGTGAGGTTCGCCTAACGATGACCTGGCGTGCCCTGCTGGACACGACCAGTTGAGTTTACCCGCCCTTAAGGGTGCTTTGTGGATTATTGTGTTCACCTTGCTAGAGCTTTGCCAGCGATGATGACGTGGCACGAGGCGGGTGTAAAAGTCTTTTTAGGTTGGTCAATTTCCATCTGATGCATTCAACAGTGAGTTGTCGATAAAAACTTTTGGCCGGGTTTGTTACTGCCCGGATGGGTTGACAGCGGTGGTCTAGCTGATCTAATTATAAGGACGGTTCGCGTCGTAACATGGGCGAAGCGACCGTCTTTAATGGAGCGCTAGATCAGCCTAACGTTATGCTATCGCTATGTACGGGTCAGTACCCGACAGGCACCGATCGAAACCTCTCTCCATTTACGTCAAGTACTATAACGCGGGCTCCTGTCTCGGCGCAGAGACAGTAGTTCGCGTTTTCTAACCCCCAATGAGAGCCTTACAGGGAACTACCGAAACCTCTGAAAGTTCGCTTGCGATCGTAGTGAGACTGATGGCCCACGGGACAAGCCCGTTAAGATTGCGCTTCCCCCAAGACCAAGGGTCCAGAGCATGAGTAGGTCGATAACCGCGAATCTCGGAGCGGTGCAACACAGGATATCTCGGCATTGGCTCTCGTTGTGCAGCAATTAGTGCTTCGACTCAACATATTCCGCGGCCTCTCAAATCTTCTCGCAAGGTCACGCGGAGTCCTTTTTATTGTTGGTCTGCAATAACTTTATCACATCACTCACTTATGGCGCTCGGGACCCCTCCTTCGTGGCTTATGATGCAGGACATGATAACATCATGTGGCCATACTAAGTATGCGAACGCGTATCCATGTGAAGCTGTTTAACCGTTGGTAGAAACAATGATTGTTTGTTACATATGCAGAATACCTACCGCAATAATATCGGTCATTAACCTGTGGCTTCCAAGCTCCAACCGATTGAGGGGGGGATAATACAGCATAACACTGGGTGGCCCTTGAAGACACGTATCCTATGTAGCACTACTGGAAGGATCTGGTCCAGATAACCGCGAGTACTGATTTGGGCGTTTCTGGCAATCACGATCTGGTTGCGAGTTGCGATCCGATCTGGGAACCCGTTGCGAGTTGCGATCCGATCTTACAAAGTCTGTACGCTGAGTGAACGGCGGGTTGCGATCGAATGGCGTCTCCTCACTTGCATTTGTTGCGATCGCCCGCCTCGTTGCGATCATGGTCAAAAAACAAACAAGTTGCGATCTCATGTTGCGATCCGATCATGAAGCCACATGACGTTGCGATCTGGTTGCGATCAACCTGGTTTCTCGGCGTTGCGATCCGCTGGAGGCGTTGGGTTGCGATCCAATGCTGAACGAAAAGCCCAGAGCGTCAAAAGGTTGCGATCTCTACACGCCTTACGCCGTAGGTTGTTGCGATCGTGGTAAACGGGGTTGCGATCAATAGTTGCGATCTCTGTTGTTGCGATCTAGTAACCAGGATGTTGCGATCGCCTTGATATTACACGGCGTGTTGCGATCTGTGTTGCGATCGTTGCGATCTTCTCTTCTGTTTACTACTGCTTATGGTCGTAGGCTGAACATCGAGTTGAAGGTTGCGATCACTGGTTCCGAACCCGTGAGGTTGCGATCCACATAAGAGGTTGCGATCTCAAAGGCTCTTCTTGCGAGGCCACGGTTGATGCCTCCAGATCGGCATCCTAAAATAGCTGGGGCCGGCTTATTCATCCACTAATTCTACCTCAAGTCTGACGGTCTAGATCCCCATTTTCCGAGTGGCGTGTCGCCCACGACCGACACCTTTCGCAGTCACGACCAGCCTGACAGACGCACATAGGAGAGTGTCGCGTAGTACCTGGCACAGGTACAAGCCAGTTTTTCCGACTGGAACGGGAGGCCAGAACACCGTAATAACCAGTCAATAATTACCGCCAATCTAACTCACATGGCACCCGAACGTTTCGAGCTTCCCTGTTGGTTTGGCCAGGTGACCTTACCGCCCATGTGATGGTGATATCTGGCCACGTTAGACCCTGGAGGTATGGACAATATATCGGGGACTTAAACCATCGCATCACTGAGGGAATCCGTTCATACTAAATAGAGTCCAAATTTATGGATCCTATAAGCGTAGCCGAGTTACATTTGTTAGTTGGGTATCTGATGGATCCTTCTTCTAGATAGGCGACTAGAAACCCCTGTGTGTTCATATTTAATGCGGCTAGTTGCGTCATAAGCTGCGCTACCGCTACCTAAGACCTGAGGACAAGTGGCCGCCATGGCCGAAGTGTTGTCTTAGCTGTCTGATACTGCAGGGACTGCACCTCCTTCGTCCTGCGTAGACAAAGTACATTTATTGGATACAAGTGTTGGCAACCAACGCGTACATAGTGTGGTACTTTGGCGACTCACAGGAAACAAACGTGCACGAGCTTCTACGGGGCATAAGCGGGTTCACGAGCTTCTATAGTGTCAATTAGCACGAGCTTATTCGGCCGGGTAAATCTGGAGGTTTCAGCCACGAGCTTAACCACGAGCTTGAGCTTAACCCGCCACGAGCTTCGTATGCAACCACGAGCTTTTAGCGGTCGGAGGTTGCTGCTGTCCACGAGCTTACGAGCTCACGAGCTTCCACGAGCTTACCTGGCGGAAAGGTACGTGCTTATCTAGTCGCGAGAGGTGAGCCTTTGCGCGTCAGTCTAACACACGAGCTTGAGCTTGAGCTCACGAGCTTGACCCCACGAGCTTCGCCGTGTCTACGCTGTACTCACGAGCTTGCTTCGAGCTTCTAGAAATGGGCACGAGCTTGCGAGGGATGTATCCTATTACACACGAGCTTCGAGCTTTTAACTGACCCGTAATCGGTCAGCGCGCACGAGCTTGGAGCTTCCACCACGAGCTTCACGAGCTTCTTGTCCTGAAAAATTTGACGACTCAAGGTTCGTGTGGAATCGTTTCTCCCACACGAGCTTGTAGTTTTTGGTTCTCTACCGAAGTCTAGTCGTTCCACACGAGCTTTTCGGGGTTTGAAGTGGCTGACCATACGCCATAACGGGGCAGTTCTCTCCGTCCATCGCTGATTTTAAGATTGGGCAGGGCCGGAGAACGTTCAGCCGGCGGAGTCGACCACTGGCTGACAATACATATTGCTTCATATTACGTTATAACTCATTCATGTCAACCAACGTCCGGGTTTGGTGGTCGGGGGTACCGGAGACTTGTCGTTACCAACTTGGTAATTCAGTTACGATTGAATCATATTCTGATGCATTTCTAGGTATTTTGCTTCACCTCTTTGGCATGCAATAAATCTTTATTAGGCTAAAGCCCAAAAATCAAGTTTACCCCGCGAGTATACTAGCTCCGGAAAAGTAGATTCTATATACCGTATACTGTCGCACTGCAGCCCTTATCTACCCTCCAGATGTAGTGCCGAGAGGCAACGTGATTACTATTTCGGTGGGCTACGATCGTGATTACGCGCGTGATTACGACGTGATTACCTCGCAAGATGGTTATCGTGATTACGATTACAATACATCTATGGCTCGTGATTACGATTACTTCGAAAGTTGTACCCTGCTCAACTGCCGCCACCGTGATTACGTGATTACTTACCTAGATAGGATCGTGGTAGATCGACCCTAGATACCTAACTTCCGCGTGATTAGATGAATAGGAATAGCAGGTCCGGATGAATAGAATGTCGTGATTACATCGAGATGATGAATAGAGACGTGAGATGAATAGCGTGATTACGATTACCGGATGAATAGGGAGATCAAGTTGCACTGCGTGAGTCCAGTAAGATGAATAGCGCCCAAAAGGCGTGATTACGATGAATAGCGCCCGATGAATAGAGATGAATAGCTTAGGGGCGTGATTACCGATGAATAGATTTCGATGAAGATGAATAGATGAGATGAATAGGAGTCGATGAATAGATGAATGATGAATAGCCCCAAAGGGCCAGATGAATAGGACCAATAGATGAAGATGAATAGATTACTACGATGAATAGGAATAGGGCCGGATGAAGATGAATAGTGAGATGAATAGCACCTGAGATGTGGAGTGAGTCGTGGGATGAATAGGTGTACCCATGCAGGTTCCCAAGAGGACGCAGATGAATAGAATCACCTCGAATCGAGCCTCCTGCGACGCGAGGGATCGGATGAATAGACATAAACTCGTTCGAACTCCGGCAGGAGATGAATGATGAATAGAATAGTATTGGGTTACCTGCAAGACCTAAATCATCGAATGACTACCCATAGAGCTATGACACGTCTATGAGGTCGAGTAGGACATTAGTCCCATGTTGATAGGGGGTCCTTTCCCCACTGCATACGTCTTTTAGGGCGGTAGGCATCATTAACCTATGACAGCTGCCAAAGAATCTTCCATCGCCAACATACTCCCCCAGTAGCCCACGGTAGTAATCATAAACCTTCCACCGACCAGAGTTTTTCCAAGACGGTTCGAAGCCACACCAATAAATCACGAGGTTAGAGTAGAAGGTCCGACGTGGGGGGCATTCTCCTTGACGAGACCCATCCTCACGAGCGTCCCCTCCTTAAAGGGACGGAAGGATTGCGTTGTTGTTACCCAACTAAGACACCAATCCCATTTGCCACCCCCCGCCCTCCCGAGTCTGTCTATAGCGCAAGTCGTTGAGCTGTCTTCCATTCCAAGCCTTCCGCGAGTAGGTAGGATCGACTTCGATCTGTCATTGTACTGGTTTAAATTCTTTTTTGGCAAATTCATAGTAGCGAGATGCACCCCGAAGACCACATTAGACCCTTGTATCTTCTCTCTTGGACGCTCAAGCCCTTGCTTTCCCACTCTACTTGTTGGATAAGTCCGTTTAAATTTTCGAACCTTCGTAAGAGTGCACTACGTTACACCTTACGTAGAAAATTCCTGACGGGCACCTTTGTTTTGAACCGACCTCGTATTTCGGATAGGCGTGCTCCAGTGAAGTAACCTAGCCGAAGCATGTATTCTTGAGCCCCCTTTTTCACCATCGGTTCCAGCGCTAGTCTTCCAGCGCGGCCTTCCAGCGCTTCCAGCGCATTCCAGCGCATCGTTTCCAGCGCCGCCTCGGGTGCGTTCATCACAGGTAACCCGCATTCCAGCGCCAGCTTCCAGCGCGCTGTATGTTCCAAATTTCCTTCCAGCGCTCCAGCGCCGCGCTCCAAATAGTGGCGAACGGACATAGCGCGATGGTTGAAGCGTATTCCAGCGCGCCATTTCCAGCGCGCGCATTACCGCCAGGGAATTTCCAGCTTTTCCAGCGCCTTTTCCAGCGCATGAAGATATAGGCCAGTAGGCTTCTCTCATCAATTCCAGCGCCTATGATGCTTGAGAACATATTCCTTCCAGCGCGCGTCAACGCTCACGAGGCTTGTTTTCCAGCGCCCAGTTCCAGCGCAAAACCTAAACCTATTATGATGCGTAGTAGAGCCTCGCGGGTTCCAGCGCTTATTCCAGCGTTCCAGCGCGTTCGACTTCTTCCAGCGCCCTTCGTGCCTGTCCATGAACTGGGTTAATTCCAGCGCTTAATTCCAGCGCAACTCTTTTGACGCTTCCAGCGCTTTCCAGCGCCAGCGCATCAAAGAAAGGTCTACGAACGCCTGATGGTCGCTAGACATGAGAAGGGAGATTCCGATTTTTCCGATACAAATGTAACGGTAACCGGAGGGCGCCTTGGGGGTCACCTGAGAACAACCCGCTCCCTGAGCCCACCGGCTCTTAATGGAAAGGTGCGAGGGCCGCAGTTTAGAGGGGATGCCCGAGAGCGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGGTCGTGCGGAGAAGAAAATCCGTGCGGAGAAAATCCGTCGAGAAAATAGAAAATCCCGTGCGGGTCGTGCGGGTCGTGCGAGAAAATCCGGTCGTGCGGGTCGTGCAGAAAATCCGGGTCGAGAAAATAGAAAATCCCGTGCGGAGAAAATCCGTCGTAGAAAATCCGCGGGTCGTGAGAAAATCCAAAATCCTGCGGGTCAGAAAATCCGTGCGGGTCGTTAGAAAATCCAAAATCCTTTCGTGGGTTTCGTGGGTTTCGTGGGTTTCGTAGAAAATAGAAAATCCGTGGGAGAAAAGAAAATCCTGGGTTTCGTGGGTTTCGAGAAAATCCGTGGAGAAAATCCTTTCGTGGGTTTCGTGGGTTTCGTGGGTTTCGTGGGAGAAAATCCTTTCGTGGGTTTCGTGGGTTTCGTGGGTTTCGTAGAAAATCCTGGGTTCGTGGGTTTCGTTAGAAAAGAAAATCCCGTGAGAAAATCCGGTTTCGTAGAAAATCCAATCCTCGTGAGAAAATCCGGTAGAAAATCCAGAAAAAGAAAATCCAGAAAATCCAGAAAATCC' asSequence clumpFindK: 9 length: 516 times: 19) asArray hasEqualElements: #('GTTGCGATC' 'GATGAATAG' 'AGTGGTTGC' 'GCGGGTCGT' 'CACGAGCTT' 'GCCGTATTC' 'CCTTTAAAA' 'AGAAAATCC' 'TTCCAGCGC'))
]

{ #category : #testing }
BioSequenceTest >> testComplement [

	| seq1 seq2 comp |
	
	seq1 := BioSequence newAmbiguousDNA: 'TACTCGTAATTCACT'.
	seq2 := BioSequence newAmbiguousDNA: 'ATGAGCATTAAGTGA'.

	comp := seq1 complement.

	self assert: 'TACTCGTAATTCACT' asSequence complementary equals: 'ATGAGCATTAAGTGA'.
	self assert: (comp isKindOf: BioSequence).
	self assert: (comp alphabet isKindOf: BioIUPACDNA).
	self assert: comp equals: seq2.
	self assert: comp asString equals: 'ATGAGCATTAAGTGA'.





]

{ #category : #testing }
BioSequenceTest >> testConcat [

	| seq1 seq2 result |
	
	seq1 := BioSequence newUnambiguousDNA: self sampleDnaString01.
	seq2 := BioSequence newUnambiguousDNA: self sampleDnaString02.
	result := seq1 , seq2.
	
	self assert: (result isKindOf: BioSequence ).
	self assert: (result alphabet isKindOf: BioIUPACUnambiguousDNA).
	self assert: result length equals: (seq1 length + seq2 length).
	self assert: result asString equals: (seq1 asString , seq2 asString).



]

{ #category : #testing }
BioSequenceTest >> testCopyFrom [

	| testSeq1 |

	testSeq1 := self sequence copyFrom: 2.

	self deny: self sequence = testSeq1.
	self assert: self sequence asString allButFirst equals: testSeq1 asString.

]

{ #category : #testing }
BioSequenceTest >> testCopyFromTo [

	| testSeq1 |

	testSeq1 := self sequence copyFrom: 2 to: self sequence size.

	self deny: self sequence = testSeq1.
	self assert: self sequence asString allButFirst equals: testSeq1 asString.

]

{ #category : #testing }
BioSequenceTest >> testDisambiguate [
	
	| disambiguatedSeqs |

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {''}).
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHT') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: { 'ATT' . 'AAT' . 'ACT' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'ART') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: { 'AAT' . 'AGT' }).
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHR') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {'ATA' . 'ATG' . 'AAA' . 'AAG' . 'ACA' . 'ACG' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHRV') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {'AAAA' . 'ACAA' . 'ATAA' . 'AACA' . 'ACCA' . 'ATCA' . 'AAGA' . 'ACGA' . 'ATGA' . 'AAAG' . 'ACAG' . 'ATAG' . 'AACG' . 'ACCG' . 'ATCG' . 'AAGG' . 'ACGG' . 'ATGG' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'ACGT') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {'ACGT'}).
]

{ #category : #testing }
BioSequenceTest >> testEqual [

	| testSeq1 |
	testSeq1 := BioSequence newDNA: self sampleDnaString01.
	self assert: self sequence equals: testSeq1.
	
	testSeq1 := BioSequence newAmbiguousDNA: self sampleDnaString01.
	self deny: self sequence = testSeq1.

	testSeq1 := BioSequence newDNA: self sampleDnaString01 , 'a'.
	self deny: self sequence = testSeq1.
	
	testSeq1 := BioSequence newDNA: self sampleDnaString01 reversed.
	self deny: self sequence = testSeq1.
]

{ #category : #testing }
BioSequenceTest >> testExpectedProbabilitySeqOfSizePatternLengthAlphabetSizeOccurrences [

	" What is the expected number of occurrences of a 9-mer in 500 sequences, each of length 1000? 
	Assume that the sequences are formed by selecting each nucleotide (A, C, G, T) with the same probability (0.25). "
	self assert: (BioSequence expected: 500 probabilitySeqOfSize: 1000 patternLength: 9 alphabetSize: 4 occurrences: 1) equals: 1.89208984375
]

{ #category : #testing }
BioSequenceTest >> testGcContent [

	self assert: 'gacgatcggtattcgtag' asSequence gcContent equals: 50.0.



]

{ #category : #'tests-accessing' }
BioSequenceTest >> testGcSkewInt [

	self assert: (('GAGCCACCGCGATA' asSequence gcSkewInt) hasEqualElements: #(0 1 1 2 1 0 0 -1 -2 -1 -2 -1 -1 -1 -1)).
	self assert: (('CATGGGCATCGGCCATACGCC' asSequence gcSkewInt) hasEqualElements: #(0 -1 -1 -1 0 1 2 1 1 1 0 1 2 1 0 0 0 0 -1 0 -1 -2)).
]

{ #category : #testing }
BioSequenceTest >> testHasAmbiguousBases [

	| seq1 seq2 seq3 result |
	
	seq1 := BioSequence newAmbiguousDNA: self sampleDnaString03.
	seq2 := BioSequence newAmbiguousDNA: self sampleDnaString02.
	seq3 := BioSequence newAmbiguousDNA: self sampleDnaString04.
	
	self assert: seq1 hasAmbiguousBases.
	self deny: seq2 hasAmbiguousBases.
	self assert: seq3 hasAmbiguousBases.

	seq1 := BioSequence newAmbiguousRNA: self sampleRnaString01.
	seq2 := BioSequence newAmbiguousRNA: self sampleRnaString02.

	self assert: seq1 hasAmbiguousBases.
	self deny: seq2 hasAmbiguousBases.
	
	seq1 := BioSequence newProtein: self sampleProtString01.
	seq2 := BioSequence newProtein: self sampleProtString02.

	self deny: seq1 hasAmbiguousBases.
	self assert: seq2 hasAmbiguousBases.
]

{ #category : #testing }
BioSequenceTest >> testIsDNASequence [

	| seq1 seq2 seq3 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq3 := BioSequence newProteinExtended: 'RRLRTGLARVGR'.
	
	self assert: seq1 isDNASequence.
	self deny: seq2 isDNASequence.
	self deny: seq3 isDNASequence.





]

{ #category : #testing }
BioSequenceTest >> testIsProteinSequence [

	| seq1 seq2 seq3 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq3 := BioSequence newProteinExtended: 'RRLRTGLARVGR'.
	
	self deny: seq1 isProteinSequence.
	self deny: seq2 isProteinSequence.
	self assert: seq3 isProteinSequence.





]

{ #category : #testing }
BioSequenceTest >> testIsRNASequence [

	| seq1 seq2 seq3 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq3 := BioSequence newProteinExtended: 'RRLRTGLARVGR'.
	
	self deny: seq1 isRNASequence.
	self assert: seq2 isRNASequence.
	self deny: seq3 isRNASequence.





]

{ #category : #testing }
BioSequenceTest >> testJoinSequence [

	| seq01 |
	
	seq01 := #('CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA
' 'CATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT
').
	self assert: (BioSequence joinSequence: seq01) equals: 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACACATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT'.
	
	self assert: (BioSequence joinSequence: String empty) equals: String empty.
]

{ #category : #testing }
BioSequenceTest >> testKmersCount [

	self assert: ('GCGCG' asSequence kmersCount: 'GCG') equals: 2.
	self assert: ('ACGTACGTACGT' asSequence kmersCount: 'CG') equals: 3.
	self assert: ('AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT' asSequence kmersCount: 'AAA') equals: 4.
	self assert: ('AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT' asSequence kmersCount: 'TTT') equals: 4.
	self assert: ('GGACTTACTGACGTACG' asSequence kmersCount: 'ACT') equals: 2.
	self assert: ('ATCCGATCCCATGCCCATG' asSequence kmersCount: 'CC') equals: 5.	
	self assert: ('CTGTTTTTGATCCATGATATGTTATCTCTCCGTCATCAGAAGAACAGTGACGGATCGCCCTCTCTCTTGGTCAGGCGACCGTTTGCCATAATGCCCATGCTTTCCAGCCAGCTCTCAAACTCCGGTGACTCGCGCAGGTTGAGTA' asSequence kmersCount: 'CTC') equals: 9.	
]

{ #category : #testing }
BioSequenceTest >> testKmersCountMismatches [

	self assert: ('TTTAGAGCCTTCAGAGG' asSequence kmersCount: 'GAGG' mismatches: 2) equals: 4.
	self assert: ('AAA' asSequence kmersCount: 'AA' mismatches: 0) equals: 2.
	self assert: ('ATA' asSequence kmersCount: 'ATA' mismatches: 1) equals: 1.


]

{ #category : #testing }
BioSequenceTest >> testMinGCSkewInt [

	self assert: ('ACCG' asSequence minGCSkewInt hasEqualElements: #(3)).
	self assert: ('ACCC' asSequence minGCSkewInt hasEqualElements: #(4)).
	self assert: ('CCGGGT' asSequence minGCSkewInt hasEqualElements: #(2)).
	self assert: ('CCGGCCGG' asSequence minGCSkewInt hasEqualElements: #(2 6)).
]

{ #category : #testing }
BioSequenceTest >> testMostFrequentKmer [

	self assert: ((('ACAACTATGCATCACTATCGGGAACTATCCT' asSequence mostFrequentKmer: 5) asArray collect: #asString) hasEqualElements: #('ACTAT')).
	self assert: ((('CGATATATCCATAG' asSequence mostFrequentKmer: 3) asArray  collect: #asString) hasEqualElements: #('ATA')).

]

{ #category : #testing }
BioSequenceTest >> testMostFrequentKmerMismatches [

	self assert: ((('AAAAAAAAAA' asSequence mostFrequentKmer: 2 mismatches: 1) asArray collect: #asString) includesAllOf: #('AA' 'AC' 'AG' 'CA' 'AT' 'GA' 'TA')).
	self assert: (((('ATA' asSequence mostFrequentKmer: 3 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('GTA' 'ACA' 'AAA' 'ATC' 'ATA' 'AGA' 'ATT' 'CTA' 'TTA' 'ATG') sorted)).
	self assert: ((('AAT' asSequence mostFrequentKmer: 3 mismatches: 0) asArray collect: #asString) hasEqualElements: #('AAT')).
	self assert: ((('TAGCG' asSequence mostFrequentKmer: 2 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('GG' 'TG') sorted).
	
	self assert: (('ACGTTGCATGTCGCATGATGCATGAGAGCT' asSequence mostFrequentKmer: 4 mismatches: 1) asArray sorted hasEqualElements: #('GATG' 'ATGC' 'ATGT') sorted).
	self assert: (('AGTCAGTC' asSequence mostFrequentKmer: 4 mismatches: 2) asArray sorted hasEqualElements: #('TCTC' 'CGGC' 'AAGC' 'TGTG' 'GGCC' 'AGGT' 'ATCC' 'ACTG' 'ACAC' 'AGAG' 'ATTA' 'TGAC' 'AATT' 'CGTT' 'GTTC' 'GGTA' 'AGCA' 'CATC') sorted).
	self assert: (('AATTAATTGGTAGGTAGGTA' asSequence mostFrequentKmer: 4 mismatches: 0) asArray sorted hasEqualElements: #('GGTA')).

]

{ #category : #testing }
BioSequenceTest >> testMostFrequentKmerRevCompMismatches [

	self assert: ((('ACGTTGCATGTCGCATGATGCATGAGAGCT' asDNASimpleSequence mostFrequentKmerRevComp: 4 mismatches: 1) asArray collect: #asString) includesAllOf: #('ACAT' 'ATGT')).
	self assert: (((('AAAAAAAAAA' asDNASimpleSequence mostFrequentKmerRevComp: 2 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('AT' 'TA'	) sorted)).
	self assert: ((('AGTCAGTC' asDNASimpleSequence mostFrequentKmerRevComp: 4 mismatches: 2) asArray sorted collect: #asString) hasEqualElements: #('AATT' 'GGCC') sorted).
	self assert: ((('ATA' asDNASimpleSequence mostFrequentKmerRevComp: 3 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('GAT' 'CTA' 'TAG' 'TTA' 'ATT' 'ATA' 'AGA' 'GTA' 'ACA' 'ATC' 'TCT' 'CAT' 'TGT' 'TTT' 'ATG' 'TAT' 'TAA' 'AAT' 'AAA' 'TAC') sorted).
	
	self assert: (('AAT' asDNASimpleSequence mostFrequentKmerRevComp: 3 mismatches: 0) asArray sorted hasEqualElements: #('AAT' 'ATT') sorted).
	self assert: (('TAGCG' asDNASimpleSequence mostFrequentKmerRevComp: 2 mismatches: 1) asArray sorted hasEqualElements: #('CA' 'CC' 'GG' 'TG') sorted).


]

{ #category : #testing }
BioSequenceTest >> testNewPrototype [

	| prototype |
	prototype := self sequence newPrototypeWith: self sampleDnaString01.
	self assert: (prototype isKindOf: BioSequence).
	
	self assert: (prototype alphabet isKindOf: self sequence alphabet class).
	self assert: self sequence size equals: prototype size.
	self assert: self sequence asString equals: prototype asString.
	

]

{ #category : #testing }
BioSequenceTest >> testOccurrencesOf [

	sequence := BioSequence newAmbiguousDNA: 'CgGAtTTAGCgCGT'.

	self assert: (sequence occurrencesOf: $G) equals: 5.
	self assert: (sequence occurrencesOf: $g) equals: 5.
	self assert: (sequence occurrencesOf: 'G') equals: 5.
	self assert: (sequence occurrencesOf: 'g') equals: 5.	
	
	self assert: (sequence occurrencesOf: 'Z') equals: 0.
	self should: [ sequence occurrencesOf: 'Cg' ] raise: BioException.
	self should: [ sequence occurrencesOf: String empty ] raise: BioException.



]

{ #category : #testing }
BioSequenceTest >> testOccurrencesOfLetters [

	| occurrences |
	occurrences := (BioSequence newAmbiguousDNA: 'CgGAtTTAGCgCGT') occurrencesOfLetters.

	self assert: (occurrences isKindOf: Dictionary).
	self assert: (occurrences at: $A) equals: 2.
	self assert: (occurrences at: $C) equals: 3.
	self assert: (occurrences at: $G) equals: 5.
	self assert: (occurrences at: $T) equals: 4.
	
	self should: [ sequence occurrencesOf: 'Cg' ] raise: BioException.
	self should: [ sequence occurrencesOf: String empty ] raise: BioException.



]

{ #category : #testing }
BioSequenceTest >> testPositionsOf [

	| expected |
	
	self sequence: self sampleProtString01 alphabet: BioIUPACUnambiguousRNA.
	expected := OrderedCollection withAll: #(11 14 23 27 67 87).
	
	self assert: (self sequence positionsOf: $K) equals: expected.
	self assert: (self sequence positionsOf: $Z) isEmpty.
	self assert: (self sequence positionsOf: 'K') equals: expected.
	self assert: (self sequence positionsOf: 'Z') isEmpty.

	self should: [ self sequence positionsOf: nil ] raise: Error.
	self should: [ self sequence positionsOf: 3 ] raise: Error.
	self should: [ self sequence positionsOf: String empty ] raise: BioException.



]

{ #category : #testing }
BioSequenceTest >> testRandomSeq [

	| seq |
	
	seq := BioSequence new 
			randomLength: 10 
			for: BioIUPACUnambiguousDNA.
	self assert: seq size equals: 10.
	self assert: seq alphabet equals: BioIUPACUnambiguousDNA



]

{ #category : #testing }
BioSequenceTest >> testReverseComplement [

	| seq1 seq2 revComp |
	
	seq1 := BioSequence newAmbiguousDNA: 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC'.
	seq2 := BioSequence newAmbiguousDNA: 'GCTAATGCCGTAGTAATTTTCCCGTCCTCCCGT'.

	revComp := seq1 reverseComplement.

	self assert: (revComp isKindOf: BioSequence).
	self assert: (revComp alphabet isKindOf: BioIUPACDNA).
	self assert: revComp equals: seq2.
	self assert: revComp asString equals: 'GCTAATGCCGTAGTAATTTTCCCGTCCTCCCGT'.

	seq1 := BioSequence newUnambiguousDNA: 'CTAAACATCCTTCAT'.
	seq2 := BioSequence newUnambiguousDNA: 'ATGAAGGATGTTTAG'.
	
	self assert: seq1 reverseComplement asString equals: seq2 asString.
	self assert: (seq1 reverseComplement alphabet isKindOf: BioIUPACUnambiguousDNA).
	




]

{ #category : #testing }
BioSequenceTest >> testSize [

	self assert: (self sequence size isKindOf: Integer).
	self assert: self sequence size equals: self sampleDnaString01 size.
	self assert: self sequence length equals: self sampleDnaString01 size.	

]

{ #category : #testing }
BioSequenceTest >> testSizeExcludeTerminals [

	self sequence: (BioSequence newWith: 'MAASEHRCVGCGFRVKSLF*' alphabet: BioIUPACProtein).
	self assert: self sequence size equals: 20.
	self assert: self sequence sizeExcludeTerminals equals: 19.
	
	self sequence: (BioSequence newWith: 'MAASEHRCVGCGFRVKSLF*AMKLMNO*P' alphabet: BioIUPACProtein).
	self assert: self sequence size equals: 29.
	self assert: self sequence sizeExcludeTerminals equals: 27.
]

{ #category : #testing }
BioSequenceTest >> testSubSeqFromTo [

	| subSeqString |
	
	subSeqString := self sequence subSeqFrom: 1 to: 5.
	self assert: (subSeqString isKindOf: String).
	self assert: subSeqString equals: 'cagtc' asUppercase.
	
	subSeqString := self sequence subSeqFrom: 1 to: 1.
	self assert: (subSeqString isKindOf: String).
	self assert: subSeqString equals: 'C'.
	
	self should: [ self sequence subSeqFrom: 5 to: 1 ] raise: Error.
	self should: [ self sequence subSeqFrom: 0 to: 1 ] raise: Error.
]

{ #category : #testing }
BioSequenceTest >> testTmStaluc [

	"self assert: 'tgcagtacgtatcgt' tmStaluc equals: 42.21."



]

{ #category : #testing }
BioSequenceTest >> testTranscription [

	| seqStrand seqTranscribed |
	
	seqStrand := BioSequence newUnambiguousDNA: 'ATGAGCATTAAGTGA'.
	seqTranscribed := BioSequence newUnambiguousRNA: 'AUGAGCAUUAAGUGA'.
	self assert: seqStrand transcribe equals: seqTranscribed.
	self assert: seqStrand transcription equals: seqTranscribed asString.




]

{ #category : #testing }
BioSequenceTest >> testTranslateFromDNA [

	| seq1 seq2 seq3 seq4 translated1 translated2 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCT'.

	translated1 := seq1 translate.
	translated2 := seq2 translateToStop.
	
	self assert: (translated1 isKindOf: BioSequence).
	self assert: (translated2 isKindOf: BioSequence).

	self assert: (translated1 alphabet isKindOf: BioIUPACProtein).
	self assert: (translated2 alphabet isKindOf: BioIUPACProtein).
	
	self assert: translated1 asString equals: 'KSVYY*HACATH*L'.
	self assert: translated2 asString equals: 'KSVYY'.

	seq3 := BioSequence newAmbiguousDNA: 'CGACGTCTTCGTACGGGACTAGCTCGTGTCGGTCGC'.
	seq4 := BioSequence newProtein: 'RRLRTGLARVGR'.

	self assert: seq3 translate equals: seq4.







]

{ #category : #testing }
BioSequenceTest >> testTranslateFromRNA [

	| seq3 seq4 |
	
	seq3 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq4 := BioSequence newProtein: 'MAIVMGR*KGAR*'.

	self assert: seq3 translate = seq4.






]

{ #category : #testing }
BioSequenceTest >> testTranslated [

	| seq1 seq2 seq3 seq4 translated1 translated2 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCT'.

	translated1 := seq1 translate.
	translated2 := seq2 translateToStop.
	
	self assert: (translated1 isKindOf: BioSequence).
	self assert: (translated2 isKindOf: BioSequence).

	self assert: (translated1 alphabet isKindOf: BioIUPACProtein).
	self assert: (translated2 alphabet isKindOf: BioIUPACProtein).
	
	self assert: translated1 asString = 'KSVYY*HACATH*L'.
	self assert: translated2 asString = 'KSVYY'.

	seq3 := BioSequence newAmbiguousDNA: 'CGACGTCTTCGTACGGGACTAGCTCGTGTCGGTCGC'.
	seq4 := BioSequence newProtein: 'RRLRTGLARVGR'.

	self assert: seq3 translate = seq4.

	seq3 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq4 := BioSequence newProtein: 'MAIVMGR*KGAR*'.

	self assert: seq3 translate = seq4.

]
