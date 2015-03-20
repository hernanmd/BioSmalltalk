testing
test12transcribe

	| testSeq1 transcribedSeq |
	
	testSeq1 := 
		BioSequence 
			newWith: self sampleDnaString01 
			alphabet: self alphabetClass.
	transcribedSeq := testSeq1 transcribe.
	
	self deny: testSeq1 = transcribedSeq .
	self assert: testSeq1 size = transcribedSeq size. 
	self assert: ( transcribedSeq alphabet isKindOf: BioIUPACUnambiguousRNA ).
	self assert: transcribedSeq asString = self sampleSeq01Transcription.


