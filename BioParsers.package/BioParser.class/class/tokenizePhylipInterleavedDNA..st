parse-phylip
tokenizePhylipInterleavedDNA: aPhylipString
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) tokenizeInterleavedDNA