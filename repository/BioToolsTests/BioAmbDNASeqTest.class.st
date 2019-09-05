Class {
	#name : #BioAmbDNASeqTest,
	#superclass : #BioAbstractSequenceTest,
	#category : 'BioToolsTests-Biological'
}

{ #category : #accessing }
BioAmbDNASeqTest >> alphabetClass [

	^ BioIUPACAmbiguousDNA
]

{ #category : #testing }
BioAmbDNASeqTest >> test05reverse [

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
	
]

{ #category : #testing }
BioAmbDNASeqTest >> test12transcribe [

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



]

{ #category : #testing }
BioAmbDNASeqTest >> test13backTranscribe [

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



]

{ #category : #testing }
BioAmbDNASeqTest >> testComplement [

	self assert: ( self sequence complement isKindOf: BioSequence ).
	self assert: self sequence complement asString = self sampleSeq01Complementary.
	self assert: self sequence complementary = self sampleSeq01Complementary.
	
	sequence := BioSequence newWith: 'ggattcggatataattattgactgtacat'.
	
	self assert: ( sequence alphabet isKindOf: BioIUPACUnambiguousDNA ).
	self assert: sequence complement asString = 'cctaagcctatattaataactgacatgta'.
	
	sequence := 'a' asSequence.
	self assert: sequence complement asString = 't'.
	
	sequence := 'c' asSequence.
	self assert: sequence complement asString = 'g'.
	
	sequence := String empty asSequence.
	self assert: sequence complement asString = String empty.
	
]
