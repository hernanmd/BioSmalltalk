Class {
	#name : #BioPhylipParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #testing }
BioPhylipParserTest >> firstLineTokenizer [

	^ BioPhylipParser new firstLineTokenizer 
]

{ #category : #testing }
BioPhylipParserTest >> phylipInterleavedDNA [

	^ '  6   13    
Archaeopt CGATGCTTAC CGCCGATGCT
HesperorniCGTTACTCGT TGTCGTTACT
BaluchitheTAATGTTAAT TGTTAATGTT
B. virginiTAATGTTCGT TGTTAATGTT
BrontosaurCAAAACCCAT CATCAAAACC
B.subtilisGGCAGCCAAT CACGGCAGCC

TACCGCCGAT GCTTACCGC
CGTTGTCGTT ACTCGTTGT
AATTGTTAAT GTTAATTGT
CGTTGTTAAT GTTCGTTGT
CATCATCAAA ACCCATCAT
AATCACGGCA GCCAATCAC

CCCCGCCCCC GCTTACCGC
CCCCGTCCCC ACTCGTTGT
CCCCGTCCCC GTTAATTGT
CCCCGTCCCC GTTCGTTGT
CCCCATCCCC ACCCATCAT
CCCCACCCCC GCCAATCAC
'
]

{ #category : #testing }
BioPhylipParserTest >> phylipInterleavedProtein [

	^ ' 5 176
cox2_leitaMAFILSFWMI FLLDSVIVLL SFVCFVCVWI CALLFSTVLL VSKLNNIYCT
cox2_crifaMAFILSFWMI FLIDAVIVLL SFVCFVCIWI CSLFFSSFLL VSKINNVYCT
cox2_bsaltMSFIISFWML FLIDSLIVLL SGAIFVCIWI CSLFFLCILF ICKLDYIFCS
cox2_trybbMSFILTFWMI FLMDSIIVLI SFSIFLSVWI CALIIATVLT VTKINNIYCT
cox2_tborrMLFFINQLLL LLVDTFVILE IFSLFVCVFI IVMYILFINY NIFLKNINVY

WDFTASKFID VYWFTIGGMF SLGLLLRLCL LLYFGHLNFV SFDLCKVVGF
WDFTASKFID AYWFTIGGMF VLCLLLRLCL LLYFGCLNFV SFDLCKVVGF
WDFISAKFID LYWFTLGCLF IVCLLIRLCL LLYFSCLNFV CFDLCKCIGF
WDFISSKFID TYWFVLGMMF ILCLLLRLCL LLYFSCINFV SFDLCKVIGF
LDFIGSKYLD LYWFLIGIFF VIVLLIRLCL LLYYSWISLL IFDLCKIMGF

QWYWVYFIFG ETTIFSNLIL ESDYMIGDLR LLQCNHVLTL LSLVIYKLWL
QWYWVYFIFG ETTIFSNLIL ESDYLIGDLR LLQCNHVLTL LSLVIYKLWL
QWYWVYFIFG ETTIFSNLIL ESDYLIGDLR LLQCNHVLTL LSLVIYKVWL
QWYWVYFLFG ETTIFSNLIL ESDYLIGDLR ILQCNHVLTL LSLVIYKLWV
QWYWIFFVFK ENVIFSNLLI ESDYWIGDLR LLQCNNTFNL ICLVVYKIWV

SAVDVIHSFA ISSLGVKVEN LVAVMK
SAVDVIHSFA VSSLGIKVDC IPGRCN
SAIDVIHSFT LANLGIKVD? ?PGRCN
SAVDVIHSFT ISSLGIKVEN PGRCNE
TSIDVIHSFT ISTLGIKIDC IPGRCN
'
]

{ #category : #testing }
BioPhylipParserTest >> speciesDNALineTokenizer [

	^ BioPhylipParser new speciesDNALineTokenizer 
]

{ #category : #testing }
BioPhylipParserTest >> speciesDNANamedBlockTokenizer [

	^ BioPhylipParser new speciesDNANamedBlockTokenizer 
]

{ #category : #testing }
BioPhylipParserTest >> testTokenizeDNASpeciesBlock [
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

]

{ #category : #testing }
BioPhylipParserTest >> testTokenizeDNASpeciesLine [
	" Private - Answer a <String> with a sample phylip DNA "
	
	| speciesLineBlock expectedResult |
	
	speciesLineBlock := 'Archaeopt CGATGCTTAC CGC'.
	expectedResult := #('Archaeopt ' 'CGATGCTTACCGC').
	
	parseResult := self speciesDNALineTokenizer parse: speciesLineBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).

	speciesLineBlock := 'Archaeopt CGATGCTTACCGC'.	
	parseResult := self speciesDNALineTokenizer parse: speciesLineBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).
	
	speciesLineBlock := 'B. virginiTAATGTTCGT TGT'.
	expectedResult := #('B. virgini' 'TAATGTTCGTTGT').
	parseResult := self speciesDNALineTokenizer parse: speciesLineBlock.
	self assert: (parseResult bioHasEqualElements: expectedResult ).
]

{ #category : #testing }
BioPhylipParserTest >> testTokenizeFirstLine [
	" Private - Answer a <String> with a sample phylip DNA "
	
	| firstLine |
	
	firstLine := '6   13
'.
	parseResult := self firstLineTokenizer parse: firstLine.
	self assert: (parseResult bioHasEqualElements: #('6' '13') ).
	
	firstLine := '      6   13
'.
	parseResult := self firstLineTokenizer parse: firstLine.
	self assert: (parseResult bioHasEqualElements: #('6' '13') ).
	
	firstLine := '6   13    
'.
	parseResult := self firstLineTokenizer parse: firstLine.
	self assert: (parseResult bioHasEqualElements: #('6' '13') ).
]

{ #category : #testing }
BioPhylipParserTest >> testTokenizeInterleavedDNA [
	" Private - Answer a <String> with a sample phylip DNA "
	
	| phylipString |
	phylipString := self phylipInterleavedDNA.

	parseResult := BioParser tokenizePhylipInterleavedDNA: phylipString.

	self assert: parseResult size = 4.
	self assert: parseResult first = 6.
	self assert: parseResult second = 13.
	self assert: (parseResult third bioHasEqualElements: #('Archaeopt ' 'Hesperorni' 'Baluchithe' 'B. virgini' 'Brontosaur' 'B.subtilis') ).
	self assert: (parseResult fourth bioHasEqualElements:  #('CGATGCTTACCGCCGATGCTTACCGCCGATGCTTACCGCCCCCGCCCCCGCTTACCGC' 'CGTTACTCGTTGTCGTTACTCGTTGTCGTTACTCGTTGTCCCCGTCCCCACTCGTTGT' 'TAATGTTAATTGTTAATGTTAATTGTTAATGTTAATTGTCCCCGTCCCCGTTAATTGT' 'TAATGTTCGTTGTTAATGTTCGTTGTTAATGTTCGTTGTCCCCGTCCCCGTTCGTTGT' 'CAAAACCCATCATCAAAACCCATCATCAAAACCCATCATCCCCATCCCCACCCATCAT' 'GGCAGCCAATCACGGCAGCCAATCACGGCAGCCAATCACCCCCACCCCCGCCAATCAC') ).
]

{ #category : #testing }
BioPhylipParserTest >> testTokenizeInterleavedProtein [
	
	| phylipString |
	phylipString := self phylipInterleavedProtein.
	parseResult := BioParser tokenizePhylipInterleavedProtein: phylipString.

	self assert: parseResult size = 4.
	self assert: parseResult first = 5.
	self assert: parseResult second = 176.
	self assert: (parseResult third bioHasEqualElements: #('cox2_leita' 'cox2_crifa' 'cox2_bsalt' 'cox2_trybb' 'cox2_tborr')).
	self assert: (parseResult fourth bioHasEqualElements:   #('MAFILSFWMIFLLDSVIVLLSFVCFVCVWICALLFSTVLLVSKLNNIYCTWDFTASKFIDVYWFTIGGMFSLGLLLRLCLLLYFGHLNFVSFDLCKVVGFQWYWVYFIFGETTIFSNLILESDYMIGDLRLLQCNHVLTLLSLVIYKLWLSAVDVIHSFAISSLGVKVENLVAVMK' 'MAFILSFWMIFLIDAVIVLLSFVCFVCIWICSLFFSSFLLVSKINNVYCTWDFTASKFIDAYWFTIGGMFVLCLLLRLCLLLYFGCLNFVSFDLCKVVGFQWYWVYFIFGETTIFSNLILESDYLIGDLRLLQCNHVLTLLSLVIYKLWLSAVDVIHSFAVSSLGIKVDCIPGRCN' 'MSFIISFWMLFLIDSLIVLLSGAIFVCIWICSLFFLCILFICKLDYIFCSWDFISAKFIDLYWFTLGCLFIVCLLIRLCLLLYFSCLNFVCFDLCKCIGFQWYWVYFIFGETTIFSNLILESDYLIGDLRLLQCNHVLTLLSLVIYKVWLSAIDVIHSFTLANLGIKVD??PGRCN' 'MSFILTFWMIFLMDSIIVLISFSIFLSVWICALIIATVLTVTKINNIYCTWDFISSKFIDTYWFVLGMMFILCLLLRLCLLLYFSCINFVSFDLCKVIGFQWYWVYFLFGETTIFSNLILESDYLIGDLRILQCNHVLTLLSLVIYKLWVSAVDVIHSFTISSLGIKVENPGRCNE' 'MLFFINQLLLLLVDTFVILEIFSLFVCVFIIVMYILFINYNIFLKNINVYLDFIGSKYLDLYWFLIGIFFVIVLLIRLCLLLYYSWISLLIFDLCKIMGFQWYWIFFVFKENVIFSNLLIESDYWIGDLRLLQCNNTFNLICLVVYKIWVTSIDVIHSFTISTLGIKIDCIPGRCN')).
]
