testing
testTokenizeDelimitedAmbiguousSequence

	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA') equals: 'ATMTA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACTGCA') equals: 'RACTGCA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'ACTGCA[T/C]') equals: 'ACTGCAY'.

	self assert: (self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA[C/A]') equals: 'ATMTAM'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACT[A/G]GCA') equals: 'RACTRGCA'.
	self assert: (self parserClass tokenizeAmbiguousWithSeparators: '[C/T]ACTGCA[T/C]') equals: 'YACTGCAY'.	