Class {
	#name : #BioDegenerateBaseParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithSeparators [
	| seq1 seq2 seq3 |
	seq1 := self parserClass parseAmbiguousWithSeparators: 'AT[A/C]TA'.
	seq2 := self parserClass parseAmbiguousWithSeparators: '[G/A]ACTGCA'.
	seq3 := self parserClass parseAmbiguousWithSeparators: 'ACTGCA[T/C]'.
	self assert: (seq1 isKindOf: BioSequence).
	self assert: (seq2 isKindOf: BioSequence).
	self assert: (seq3 isKindOf: BioSequence).
	self assert: seq1 size equals: 5.
	self assert: seq2 size equals: 7.
	self assert: seq3 size equals: 7.
	self assert: seq1 asString equals: 'ATMTA'.
	self assert: seq2 asString equals: 'RACTGCA'.
	self assert: seq3 asString equals: 'ACTGCAY'
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithoutSeparators [
	| seq1 seq2 seq3 |
	seq1 := self parserClass parseAmbiguousWithoutSeparators: 'AT[AC]TA'.
	seq2 := self parserClass parseAmbiguousWithoutSeparators: '[GA]ACTGCA'.
	seq3 := self parserClass parseAmbiguousWithoutSeparators: 'ACTGCA[TC]'.
	self assert: (seq1 isKindOf: BioSequence).
	self assert: (seq2 isKindOf: BioSequence).
	self assert: (seq3 isKindOf: BioSequence).
	self assert: seq1 size equals: 5.
	self assert: seq2 size equals: 7.
	self assert: seq3 size equals: 7.
	self assert: seq1 asString equals: 'ATMTA'.
	self assert: seq2 asString equals: 'RACTGCA'.
	self assert: seq3 asString equals: 'ACTGCAY'
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testTokenizeAmbiguousSequenceWithoutSeparators [
	self
		assert: (self parserClass tokenizeAmbiguousWithoutSeparators: 'AT[AC]TA')
		equals: 'ATMTA'.
	self
		assert: (self parserClass tokenizeAmbiguousWithoutSeparators: '[GA]ACTGCA')
		equals: 'RACTGCA'.
	self
		assert: (self parserClass tokenizeAmbiguousWithoutSeparators: 'ACTGCA[TC]')
		equals: 'ACTGCAY'.
	self
		assert: (self parserClass tokenizeAmbiguousWithoutSeparators: 'AT[AC]TA[CA]')
		equals: 'ATMTAM'.
	self
		assert:
			(self parserClass tokenizeAmbiguousWithoutSeparators: '[GA]ACT[AG]GCA')
		equals: 'RACTRGCA'.
	self
		assert:
			(self parserClass tokenizeAmbiguousWithoutSeparators: '[CT]ACTGCA[TC]')
		equals: 'YACTGCAY'
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testTokenizeDelimitedAmbiguousSequence [

	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA') equals: 'ATMTA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACTGCA') equals: 'RACTGCA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'ACTGCA[T/C]') equals: 'ACTGCAY'.

	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA[C/A]') equals: 'ATMTAM'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACT[A/G]GCA') equals: 'RACTRGCA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[C/T]ACTGCA[T/C]') equals: 'YACTGCAY'.	
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testTokenizeResolveAmbiguousSequence [

"	self assert: (self parserClass tokenizeAmbiguousLettersToSeparators: 'ATMTA') equals: 'AT[A/C]TA'.
	self assert: (self parserClass tokenizeAmbiguousLettersToSeparators: 'RACTGCA') equals: '[G/A]ACTGCA'.
	self assert: (self parserClass tokenizeAmbiguousLettersToSeparators: 'ACTGCAY') equals: 'ACTGCA[T/C]'."

"	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA[C/A]') equals: 'ATMTAM'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACT[A/G]GCA') equals: 'RACTRGCA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[C/T]ACTGCA[T/C]') equals: 'YACTGCAY'.	"
]
