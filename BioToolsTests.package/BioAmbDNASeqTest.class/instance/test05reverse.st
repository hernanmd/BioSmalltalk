testing
test05reverse

	| seqTest |
	
	self assert: ( self sequence reversed isKindOf: BioSequence ).
	self assert: self sequence reversed asString = self sampleDnaString01 reversed.

	seqTest := BioSequence newWith: 'ggattcggatataattattgactgtacat'.
	self assert: seqTest reversed asString = 'tacatgtcagttattaatataggcttagg'.
	
	seqTest := 'a' asSequence.
	self assert: seqTest reversed asString = 'a'.
	
	seqTest := 'c' asSequence.
	self assert: seqTest reversed asString = 'c'.
	
	seqTest := String empty asSequence.
	self assert: seqTest reversed asString = String empty.
	