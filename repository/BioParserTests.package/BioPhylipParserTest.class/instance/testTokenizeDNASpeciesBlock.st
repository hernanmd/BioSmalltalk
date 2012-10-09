testing
testTokenizeDNASpeciesBlock
	" Private - Answer a <String> with a sample phylip DNA "
	
	| speciesBlock expectedResult |
	
	speciesBlock := 'Archaeopt CGATGCTTAC CGC
HesperorniCGTTACTCGT TGT
BaluchitheTAATGTTAAT TGT
B. virginiTAATGTTCGT TGT
BrontosaurCAAAACCCAT CAT
B.subtilisGGCAGCCAAT CAC'.
	expectedResult :=  #(#('Archaeopt' 'CGATGCTTACCGC' nil) #('Hesperorni' 'CGTTACTCGTTGT' nil) #('Baluchithe' 'TAATGTTAATTGT' nil) #('B.virgini' 'TAATGTTCGTTGT' nil) #('Brontosaur' 'CAAAACCCATCAT' nil)).
	
	parseResult := self speciesDNANamedBlockTokenizer parse: speciesBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).
	
	speciesBlock := 'Archaeopt CGATGCTTAC CGC
Hes       CGTTACTCGT TGT
BaluchitheTAATGTTAAT TGT
B. virginiTAATGTTCGT TGT
BrontosaurCAAAACCCAT CAT
B.subtilisGGCAGCCAAT CAC'.

	parseResult := self speciesDNANamedBlockTokenizer parse: speciesBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).
