testing
testTokenizeAmbiguousSequenceWithoutSeparators

	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: 'AT[AC]TA' ) = 'ATMTA'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: '[GA]ACTGCA' ) = 'RACTGCA'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: 'ACTGCA[TC]' ) = 'ACTGCAY'.

	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: 'AT[AC]TA[CA]' ) = 'ATMTAM'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: '[GA]ACT[AG]GCA' ) = 'RACTRGCA'.
	self assert: ( self parserClass tokenizeAmbiguousWithoutSeparators: '[CT]ACTGCA[TC]' ) = 'YACTGCAY'.	