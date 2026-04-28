Class {
	#name : 'BioSequenceStringTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Core',
	#package : 'BioTools-Tests',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> dnaSequence: aString [

	^ BioSequence newDNA: aString
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testBeginsWith [

	| seq |
	seq := self dnaSequence: 'ATCGATCG'.
	self assert: (seq beginsWith: 'ATCG').
	self deny: (seq beginsWith: 'TCGA').
	self assert: (seq beginsWith: '').
	self deny: (seq beginsWith: 'ATCGATCGATCG')
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testCountSubstring [

	| seq |
	seq := self dnaSequence: 'ATCGATCGATCG'.
	self assert: (seq countSubstring: 'ATCG') equals: 3.
	self assert: (seq countSubstring: 'GAT') equals: 2.
	self assert: (seq countSubstring: 'TTTT') equals: 0
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testCountSubstringOverlapping [

	| seq |
	seq := self dnaSequence: 'AAAA'.
	self assert: (seq countSubstring: 'AA' overlapping: false) equals: 2.
	self assert: (seq countSubstring: 'AA' overlapping: true) equals: 3
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testDropFirst [

	| seq sub |
	seq := self dnaSequence: 'ATCGATCG'.
	sub := seq dropFirst: 4.
	self assert: sub sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testDropLast [

	| seq sub |
	seq := self dnaSequence: 'ATCGATCG'.
	sub := seq dropLast: 4.
	self assert: sub sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testEndsWith [

	| seq |
	seq := self dnaSequence: 'ATCGATCG'.
	self assert: (seq endsWith: 'ATCG').
	self deny: (seq endsWith: 'CGAT').
	self assert: (seq endsWith: '').
	self deny: (seq endsWith: 'GATCGATCG')
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testFirstN [

	| seq sub |
	seq := self dnaSequence: 'ATCGATCG'.
	sub := seq first: 4.
	self assert: sub sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testFromTo [

	| seq sub |
	seq := self dnaSequence: 'ATCGATCG'.
	sub := seq from: 2 to: 5.
	self assert: sub sequence equals: 'TCGA'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIncludesAnyOf [

	| seq |
	seq := self dnaSequence: 'ATCG'.
	self assert: (seq includesAnyOf: 'XYZA').
	self deny: (seq includesAnyOf: 'N').
	self deny: (seq includesAnyOf: 'XYZ')
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIncludesSubstring [

	| seq |
	seq := self dnaSequence: 'ATCGATCG'.
	self assert: (seq includesSubstring: 'ATCG').
	self assert: (seq includesSubstring: 'CGA').
	self deny: (seq includesSubstring: 'TTTT')
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIndexOf [

	| seq |
	seq := self dnaSequence: 'ATCGATCGATCG'.
	self assert: (seq indexOf: 'ATCG') equals: 1.
	self assert: (seq indexOf: 'GAT') equals: 4.
	self assert: (seq indexOf: 'XXX') equals: 0
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIndexOfOrFail [

	| seq |
	seq := self dnaSequence: 'ATCGATCG'.
	self assert: (seq indexOfOrFail: 'CGA') equals: 3.
	self should: [ seq indexOfOrFail: 'XXX' ] raise: NotFound
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIndexOfStartingAt [

	| seq |
	seq := self dnaSequence: 'ATCGATCGATCG'.
	self assert: (seq indexOf: 'ATCG' startingAt: 1) equals: 1.
	self assert: (seq indexOf: 'ATCG' startingAt: 2) equals: 5.
	self assert: (seq indexOf: 'ATCG' startingAt: 6) equals: 9.
	self assert: (seq indexOf: 'ATCG' startingAt: 10) equals: 0
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIndexOfStartingAtEndingAt [

	| seq |
	seq := self dnaSequence: 'ATCGATCGATCG'.
	self assert: (seq indexOf: 'GAT' startingAt: 1 endingAt: 6) equals: 4.
	self
		assert: (seq indexOf: 'ATCG' startingAt: 1 endingAt: 4)
		equals: 1.
	self
		assert: (seq indexOf: 'ATCG' startingAt: 5 endingAt: 8)
		equals: 5.
	self
		assert: (seq indexOf: 'XXXX' startingAt: 1 endingAt: 12)
		equals: 0
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIsAllLowercase [

	| seq |
	seq := self dnaSequence: 'atcg'.
	self assert: seq isAllLowercase.
	seq := self dnaSequence: 'ATcg'.
	self deny: seq isAllLowercase
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testIsAllUppercase [

	| seq |
	seq := self dnaSequence: 'ATCG'.
	self assert: seq isAllUppercase.
	seq := self dnaSequence: 'ATcg'.
	self deny: seq isAllUppercase
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testJoin [

	| seqs joined |
	seqs := {
		        (self dnaSequence: 'AT').
		        (self dnaSequence: 'CG').
		        (self dnaSequence: 'TA') }.
	joined := '' join: (seqs collect: #sequence).
	self assert: joined equals: 'ATCGTA'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testJoinWithStrings [

	| joined |
	joined := '' join: #( 'AT' 'CG' 'TA' ).
	self assert: joined equals: 'ATCGTA'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testLastIndexOf [

	| seq |
	seq := self dnaSequence: 'ATCGATCGATCG'.
	self assert: (seq lastIndexOf: 'ATCG') equals: 9.
	self assert: (seq lastIndexOf: 'GAT') equals: 8.
	self assert: (seq lastIndexOf: 'XXX') equals: 0
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testLastIndexOfOrFail [

	| seq |
	seq := self dnaSequence: 'ATCGATCG'.
	self assert: (seq lastIndexOfOrFail: 'ATC') equals: 5.
	self should: [ seq lastIndexOfOrFail: 'XXX' ] raise: NotFound
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testLastIndexOfStartingAt [

	| seq |
	seq := self dnaSequence: 'ATCGATCGATCG'.
	self assert: (seq lastIndexOf: 'ATCG' startingAt: 12) equals: 9.
	self assert: (seq lastIndexOf: 'ATCG' startingAt: 8) equals: 5.
	self assert: (seq lastIndexOf: 'ATCG' startingAt: 4) equals: 1
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testLastN [

	| seq sub |
	seq := self dnaSequence: 'ATCGATCG'.
	sub := seq last: 4.
	self assert: sub sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testPadLeft [

	| seq padded |
	seq := self dnaSequence: 'ATCG'.
	padded := seq padLeft: $- to: 8.
	self assert: padded sequence equals: '----ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testPadLeftNoPaddingNeeded [

	| seq padded |
	seq := self dnaSequence: 'ATCGATCG'.
	padded := seq padLeft: $- to: 4.
	self assert: padded sequence equals: 'ATCGATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testPadRight [

	| seq padded |
	seq := self dnaSequence: 'ATCG'.
	padded := seq padRight: $- to: 8.
	self assert: padded sequence equals: 'ATCG----'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testRemovePrefix [

	| seq result |
	seq := self dnaSequence: 'PREFIXATCG'.
	result := seq removePrefix: 'PREFIX'.
	self assert: result sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testRemovePrefixNotPresent [

	| seq result |
	seq := self dnaSequence: 'ATCG'.
	result := seq removePrefix: 'XXX'.
	self assert: result sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testRemoveSuffix [

	| seq result |
	seq := self dnaSequence: 'ATCGSUFFIX'.
	result := seq removeSuffix: 'SUFFIX'.
	self assert: result sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testRemoveSuffixNotPresent [

	| seq result |
	seq := self dnaSequence: 'ATCG'.
	result := seq removeSuffix: 'XXX'.
	self assert: result sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testReplaceAllOccurrences [

	| seq replaced |
	seq := self dnaSequence: 'ATCGATCG'.
	replaced := seq replace: 'ATCG' with: 'AAAA'.
	self assert: replaced sequence equals: 'AAAAAAAA'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testReplaceWith [

	| seq replaced |
	seq := self dnaSequence: 'ATCGATCG'.
	replaced := seq replace: 'ATC' with: 'TTT'.
	self assert: replaced sequence equals: 'TTTGTTTG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testReversed [

	| seq rev |
	seq := self dnaSequence: 'ATCG'.
	rev := seq reversed.
	self assert: rev sequence equals: 'GCTA'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testSplitOn [

	| seq parts |
	seq := self dnaSequence: 'ATCG-ATCG-ATCG'.
	parts := seq splitOn: '-'.
	self assert: parts size equals: 3.
	self assert: parts first sequence equals: 'ATCG'.
	self assert: parts second sequence equals: 'ATCG'.
	self assert: parts last sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testSplitOnEmpty [

	| seq parts |
	seq := self dnaSequence: ''.
	parts := seq splitOn: '-'.
	self assert: parts size equals: 1.
	self assert: parts first sequence equals: ''
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testSplitOnMaxChunks [

	| seq parts |
	seq := self dnaSequence: 'AT-CG-AT-CG'.
	parts := seq splitOn: '-' maxChunks: 3.
	self assert: parts size equals: 3.
	self assert: parts first sequence equals: 'AT'.
	self assert: parts second sequence equals: 'CG'.
	self assert: parts last sequence equals: 'AT-CG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testTrim [

	| seq trimmed |
	seq := self dnaSequence: ' ATCG '.
	trimmed := seq trim.
	self assert: trimmed sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testTrimChars [

	| seq trimmed |
	seq := self dnaSequence: 'NNATCGNN'.
	trimmed := seq trim: 'N'.
	self assert: trimmed sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testTrimLeft [

	| seq trimmed |
	seq := self dnaSequence: ' ATCG '.
	trimmed := seq trimLeft.
	self assert: trimmed sequence equals: 'ATCG '
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testTrimNoWhitespace [

	| seq trimmed |
	seq := self dnaSequence: 'ATCG'.
	trimmed := seq trim.
	self assert: trimmed sequence equals: 'ATCG'
]

{ #category : 'as yet unclassified' }
BioSequenceStringTest >> testTrimRight [

	| seq trimmed |
	seq := self dnaSequence: ' ATCG '.
	trimmed := seq trimRight.
	self assert: trimmed sequence equals: ' ATCG'
]
