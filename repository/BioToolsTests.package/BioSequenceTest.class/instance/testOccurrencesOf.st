testing
testOccurrencesOf

	sequence := BioSequence newAmbiguousDNA: 'CgGAtTTAGCgCGT'.

	self assert: (sequence occurrencesOf: $G) = 5.
	self assert: (sequence occurrencesOf: $g) = 5.
	self assert: (sequence occurrencesOf: 'G') = 5.
	self assert: (sequence occurrencesOf: 'g') = 5.	
	
	self assert: (sequence occurrencesOf: 'Z') = 0.
	self should: [ sequence occurrencesOf: 'Cg' ] raise: BioException.
	self should: [ sequence occurrencesOf: String empty ] raise: BioException.


