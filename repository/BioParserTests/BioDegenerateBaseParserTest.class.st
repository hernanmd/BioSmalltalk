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
	
	self assert: ( seq1 isKindOf: BioSequence ).
	self assert: ( seq2 isKindOf: BioSequence ).
	self assert: ( seq3 isKindOf: BioSequence ).

	self assert: seq1 size = 5.
	self assert: seq2 size = 7.
	self assert: seq3 size = 7.
	
	self assert: seq1 asString = 'ATMTA'.
	self assert: seq2 asString = 'RACTGCA'.
	self assert: seq3 asString = 'ACTGCAY'.		

]

{ #category : #testing }
BioDegenerateBaseParserTest >> testParseAmbiguousSequenceWithoutSeparators [

	| seq1 seq2 seq3 |
	
	seq1 := self parserClass parseAmbiguousWithoutSeparators: 'AT[AC]TA'.
	seq2 := self parserClass parseAmbiguousWithoutSeparators: '[GA]ACTGCA'.
	seq3 := self parserClass parseAmbiguousWithoutSeparators: 'ACTGCA[TC]'.
	
	self assert: ( seq1 isKindOf: BioSequence ).
	self assert: ( seq2 isKindOf: BioSequence ).
	self assert: ( seq3 isKindOf: BioSequence ).

	self assert: seq1 size = 5.
	self assert: seq2 size = 7.
	self assert: seq3 size = 7.
	
	self assert: seq1 asString = 'ATMTA'.
	self assert: seq2 asString = 'RACTGCA'.
	self assert: seq3 asString = 'ACTGCAY'.		

]

{ #category : #testing }
BioDegenerateBaseParserTest >> testTokenizeAmbiguousSequenceWithoutSeparators [

	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: 'AT[AC]TA' ) = 'ATMTA'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: '[GA]ACTGCA' ) = 'RACTGCA'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: 'ACTGCA[TC]' ) = 'ACTGCAY'.

	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: 'AT[AC]TA[CA]' ) = 'ATMTAM'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: '[GA]ACT[AG]GCA' ) = 'RACTRGCA'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: '[CT]ACTGCA[TC]' ) = 'YACTGCAY'.	
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
