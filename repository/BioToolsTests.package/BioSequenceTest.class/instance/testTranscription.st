testing
testTranscription

	| seqStrand seqTranscribed |
	
	seqStrand := BioSequence newUnambiguousDNA: 'ATGAGCATTAAGTGA'.
	seqTranscribed := BioSequence newUnambiguousRNA: 'AUGAGCAUUAAGUGA'.
	self assert: seqStrand transcribe equals: seqTranscribed.
	self assert: seqStrand transcription equals: seqTranscribed asString.



