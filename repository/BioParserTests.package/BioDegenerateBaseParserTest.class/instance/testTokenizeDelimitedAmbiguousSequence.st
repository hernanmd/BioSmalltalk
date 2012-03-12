testing
testTokenizeDelimitedAmbiguousSequence

	self assert: ( self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA' ) = 'ATMTA'.
	self assert: ( self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACTGCA' ) = 'RACTGCA'.
	self assert: ( self parserClass tokenizeAmbiguousWithSeparators: 'ACTGCA[T/C]' ) = 'ACTGCAY'.

	self assert: ( self parserClass tokenizeAmbiguousWithSeparators: 'AT[A/C]TA[C/A]' ) = 'ATMTAM'.
	self assert: ( self parserClass tokenizeAmbiguousWithSeparators: '[G/A]ACT[A/G]GCA' ) = 'RACTRGCA'.
	self assert: ( self parserClass tokenizeAmbiguousWithSeparators: '[C/T]ACTGCA[T/C]' ) = 'YACTGCAY'.	