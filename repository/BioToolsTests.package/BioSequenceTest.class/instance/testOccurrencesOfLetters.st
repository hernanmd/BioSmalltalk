testing
testOccurrencesOfLetters

	| occurrences |
	occurrences := (BioSequence newAmbiguousDNA: 'CgGAtTTAGCgCGT') occurrencesOfLetters.

	self assert: (occurrences isKindOf: Dictionary).
	self assert: (occurrences at: $A) equals: 2.
	self assert: (occurrences at: $C) equals: 3.
	self assert: (occurrences at: $G) equals: 5.
	self assert: (occurrences at: $T) equals: 4.
	
	self should: [ sequence occurrencesOf: 'Cg' ] raise: BioException.
	self should: [ sequence occurrencesOf: String empty ] raise: BioException.


