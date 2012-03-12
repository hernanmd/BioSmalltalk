testing
testLetters01DNA

	self assert: (BioIUPACUnambiguousDNA 	new codes bioHasEqualElements: 'GATCN').
	self assert: (BioIUPACAmbiguousDNA 		new codes bioHasEqualElements: 'GATCRYWSMKHBVDN' ).
	self assert: (BioIUPACDNAExtended 		new codes bioHasEqualElements: 'GATCBDSW').

	