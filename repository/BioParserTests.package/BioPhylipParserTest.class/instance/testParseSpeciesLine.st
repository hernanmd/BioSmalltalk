testing
testParseSpeciesLine
	" Private - Answer a <String> with a sample phylip DNA "
	
	| speciesLineBlock expectedResult |
	
	speciesLineBlock := 'Archaeopt CGATGCTTAC CGC'.
	expectedResult := #('Archaeopt' 'CGATGCTTACCGC').
	
	parseResult := self speciesDNALineTokenizer parse: speciesLineBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).

	speciesLineBlock := 'Archaeopt CGATGCTTACCGC'.	
	parseResult := self speciesDNALineTokenizer parse: speciesLineBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).
	
	speciesLineBlock := 'B. virginiTAATGTTCGT TGT'.
	expectedResult := #('B.virgini' 'TAATGTTCGTTGT').
	parseResult := self speciesDNALineTokenizer parse: speciesLineBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).