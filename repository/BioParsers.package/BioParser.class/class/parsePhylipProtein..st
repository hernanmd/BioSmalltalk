parse-phylip
parsePhylipProtein: aPhylipString
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) parseProtein