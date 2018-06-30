testing
testEqual

	| testSeq1 |
	testSeq1 := BioSequence newDNA: self sampleDnaString01.
	self assert: self sequence equals: testSeq1.
	
	testSeq1 := BioSequence newAmbiguousDNA: self sampleDnaString01.
	self deny: self sequence = testSeq1.

	testSeq1 := BioSequence newDNA: self sampleDnaString01 , 'a'.
	self deny: self sequence = testSeq1.
	
	testSeq1 := BioSequence newDNA: self sampleDnaString01 reversed.
	self deny: self sequence = testSeq1.