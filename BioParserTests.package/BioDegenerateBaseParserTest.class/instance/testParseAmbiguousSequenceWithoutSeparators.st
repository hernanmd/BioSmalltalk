testing
testParseAmbiguousSequenceWithoutSeparators

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
