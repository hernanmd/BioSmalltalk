testing
testTokenizeInterleavedDNA
	" Private - Answer a <String> with a sample phylip DNA "
	
	| phylipString |
	phylipString := self phylipInterleavedDNA.

	parseResult := BioParser tokenizePhylipInterleavedDNA: phylipString.

	self assert: parseResult size = 4.
	self assert: parseResult first = 6.
	self assert: parseResult second = 13.
	self assert: (parseResult third bioHasEqualElements: #('Archaeopt ' 'Hesperorni' 'Baluchithe' 'B. virgini' 'Brontosaur' 'B.subtilis') ).
	self assert: (parseResult fourth bioHasEqualElements:  #('CGATGCTTACCGCCGATGCTTACCGCCGATGCTTACCGCCCCCGCCCCCGCTTACCGC' 'CGTTACTCGTTGTCGTTACTCGTTGTCGTTACTCGTTGTCCCCGTCCCCACTCGTTGT' 'TAATGTTAATTGTTAATGTTAATTGTTAATGTTAATTGTCCCCGTCCCCGTTAATTGT' 'TAATGTTCGTTGTTAATGTTCGTTGTTAATGTTCGTTGTCCCCGTCCCCGTTCGTTGT' 'CAAAACCCATCATCAAAACCCATCATCAAAACCCATCATCCCCATCCCCACCCATCAT' 'GGCAGCCAATCACGGCAGCCAATCACGGCAGCCAATCACCCCCACCCCCGCCAATCAC') ).