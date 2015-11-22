testing
testDisambiguate
	
	| disambiguatedSeqs |
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHT') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'ART') disambiguate.
	self assert: self sequence = disambiguatedSeqs.
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHR') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHRV') disambiguate.
	self assert: disambiguatedSeqs equals: (BioSequence fromUmambiguousDNASequences: {'AAAA' . 'ACAA' . 'ATAA' . 'AACA' . 'ACCA' . 'ATCA' . 'AAGA' . 'ACGA' . 'ATGA' . 'AAAG' . 'ACAG' . 'ATAG' . 'AACG' . 'ACCG' . 'ATCG' . 'AAGG' . 'ACGG' . 'ATGG' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHRY') disambiguate.
	self assert: self sequence = disambiguatedSeqs.

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'ACGT') disambiguate.
	self assert: self sequence = disambiguatedSeqs.