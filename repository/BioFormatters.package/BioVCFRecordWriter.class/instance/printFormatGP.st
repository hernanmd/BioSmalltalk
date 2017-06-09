accessing - format
printFormatGP
	" Set the phred-scaled genotype posterior probabilities (and otherwise dened precisely as the GL field); intended to store imputed genotype probabilities (Floats) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GP'
