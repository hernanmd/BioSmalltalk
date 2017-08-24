exporting
exportNumberOfNucleotidesOrAminoacids
	" Write the receiver's number of nucleotides or amino acids "
	
	self stream
		nextPutAll: 'NSites=';
		nextPutAll: self numberOfNucleotidesOrAminoacids asString