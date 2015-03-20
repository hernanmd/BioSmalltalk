parse-phylip
tokenizePhylipInterleavedProtein: aPhylipString
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) tokenizeInterleavedProtein