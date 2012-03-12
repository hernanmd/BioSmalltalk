testing
testParseAmbiguousSequenceWithSeparators

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
