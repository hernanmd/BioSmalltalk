testing
testOccurrencesOf

	sequence := BioSequence newAmbiguousDNA: 'CgGAtTTAGCgCGT'.

	self assert: (sequence occurrencesOf: $G) equals: 5.
	self assert: (sequence occurrencesOf: $g) equals: 5.
	self assert: (sequence occurrencesOf: 'G') equals: 5.
	self assert: (sequence occurrencesOf: 'g') equals: 5.	
	
	self assert: (sequence occurrencesOf: 'Z') equals: 0.
	self should: [ sequence occurrencesOf: 'Cg' ] raise: BioException.
	self should: [ sequence occurrencesOf: String empty ] raise: BioException.


