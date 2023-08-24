Class {
	#name : #BioDegenerateBaseParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Basic'
}

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithSeparators01 [

	parseResult := self parserClass parseAmbiguousWithSeparators: 'AT[A/C]TA'.

	self assert: parseResult size equals: 5.
	self assert: parseResult asString equals: 'ATMTA'.
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithSeparators02 [

	parseResult := self parserClass parseAmbiguousWithSeparators: '[G/A]ACTGCA'.

	self assert: parseResult size equals: 7.
	self assert: parseResult asString equals: 'RACTGCA'.

]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithSeparators03 [

	parseResult := self parserClass parseAmbiguousWithSeparators: 'ACTGCA[T/C]'.

	self assert: parseResult size equals: 7.
	self assert: parseResult asString equals: 'ACTGCAY'
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithoutSeparators01 [

	parseResult := self parserClass parseAmbiguousWithoutSeparators: 'AT[AC]TA'.

	self assert: parseResult size equals: 5.
	self assert: parseResult asString equals: 'ATMTA'.
]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithoutSeparators02 [

	parseResult := self parserClass parseAmbiguousWithoutSeparators: '[GA]ACTGCA'.

	self assert: parseResult size equals: 7.
	self assert: parseResult asString equals: 'RACTGCA'.

]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithoutSeparators03 [

	parseResult := self parserClass parseAmbiguousWithoutSeparators: 'ACTGCA[TC]'.

	self assert: parseResult size equals: 7.
	self assert: parseResult asString equals: 'ACTGCAY'
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
