testing
testParseSpeciesBlock
	" Private - Answer a <String> with a sample phylip DNA "
	
	| speciesBlock expectedResult |
	
	speciesBlock := 'Archaeopt CGATGCTTAC CGC
HesperorniCGTTACTCGT TGT
BaluchitheTAATGTTAAT TGT
B. virginiTAATGTTCGT TGT
BrontosaurCAAAACCCAT CAT
B.subtilisGGCAGCCAAT CAC'.
	expectedResult :=  #(#('Archaeopt' 'CGATGCTTACCGC') #('Hesperorni' 'CGTTACTCGTTGT') #('Baluchithe' 'TAATGTTAATTGT') #('B.virgini' 'TAATGTTCGTTGT') #('Brontosaur' 'CAAAACCCATCAT')).
	
	parseResult := self speciesDNABlockTokenizer parse: speciesBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).