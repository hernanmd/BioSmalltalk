testing
testDisambiguate
	
	| disambiguatedSeqs |
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: self sequence = disambiguatedSeqs.
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: self sequence = disambiguatedSeqs.