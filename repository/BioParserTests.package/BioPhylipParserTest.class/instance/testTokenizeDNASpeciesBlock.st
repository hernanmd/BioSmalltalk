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
	expectedResult :=  #(#('Archaeopt ' 'CGATGCTTAC CGC' nil) #('Hesperorni' 'CGTTACTCGT TGT' nil) #('Baluchithe' 'TAATGTTAAT TGT' nil) #('B. virgini' 'TAATGTTCGT TGT' nil) #('Brontosaur' 'CAAAACCCAT CAT' nil)).
	
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
