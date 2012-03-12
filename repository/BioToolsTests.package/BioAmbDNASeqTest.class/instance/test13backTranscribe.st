testing
test13backTranscribe

	| testSeq1 backTranscribedSeq |
	
	testSeq1 := 
		BioSequence 
			newWith: self sampleSeq01Transcription 
			alphabet: BioIUPACUnambiguousRNA.
	backTranscribedSeq := testSeq1 backTranscribe.
	
	self deny: testSeq1 = backTranscribedSeq.
	self assert: testSeq1 size = backTranscribedSeq size. 
	self assert: ( backTranscribedSeq alphabet isKindOf: BioIUPACUnambiguousDNA ).
	self assert: backTranscribedSeq asString = self sampleDnaString01.


