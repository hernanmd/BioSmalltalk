testing
test04PutSettings

	| cmd |

	cmd := self ncbiClient nucleotide query: '555'.
	self assert: cmd client downloadUrl = 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&QUERY=555&DATABASE=nr'.
	
	cmd := self newNCBIClient nucleotide autoFormatFull.
	self assert: cmd client downloadUrl = 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&AUTO_FORMAT=Fullauto'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatFull..
	self assert: cmd client downloadUrl = 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&QUERY=555&DATABASE=nr&AUTO_FORMAT=Fullauto'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatOff.
	self assert: cmd client downloadUrl = 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&QUERY=555&DATABASE=nr&AUTO_FORMAT=Off'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatSemiauto.
	self assert: cmd client downloadUrl = 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&QUERY=555&DATABASE=nr&AUTO_FORMAT=Semiauto'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatFull; blastn.
	self assert: (cmd tokenizeParameters includes: 'AUTO_FORMAT=Fullauto').
	self assert: (cmd tokenizeParameters includes: 'PROGRAM=blastn').

