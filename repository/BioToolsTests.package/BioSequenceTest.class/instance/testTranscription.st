testing
testTranscription

	| seqStrand seqTranscribed |
	
	seqStrand := BioSequence newUnambiguousDNA: 'ATGAGCATTAAGTGA'.
	seqTranscribed := BioSequence newUnambiguousRNA: 'AUGAGCAUUAAGUGA'.
	self assert: seqStrand transcribe = seqTranscribed.
	self assert: seqStrand transcription = seqTranscribed asString.



