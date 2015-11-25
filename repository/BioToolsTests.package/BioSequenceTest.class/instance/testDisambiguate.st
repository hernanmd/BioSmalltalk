testing
testDisambiguate
	
	| disambiguatedSeqs |

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: '') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {''}).
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHT') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: { 'ATT' . 'AAT' . 'ACT' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'ART') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: { 'AAT' . 'AGT' }).
	
	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHR') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {'ATA' . 'ATG' . 'AAA' . 'AAG' . 'ACA' . 'ACG' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'AHRV') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {'AAAA' . 'ACAA' . 'ATAA' . 'AACA' . 'ACCA' . 'ATCA' . 'AAGA' . 'ACGA' . 'ATGA' . 'AAAG' . 'ACAG' . 'ATAG' . 'AACG' . 'ACCG' . 'ATCG' . 'AAGG' . 'ACGG' . 'ATGG' }).

	disambiguatedSeqs := (BioSequence newAmbiguousDNA: 'ACGT') disambiguate.
	self assert: (disambiguatedSeqs bioHasEqualElements: {'ACGT'}).