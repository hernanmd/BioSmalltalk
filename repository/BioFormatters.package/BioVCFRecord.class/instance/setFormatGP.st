accessing - format
setFormatGP
	" Set the phred-scaled genotype posterior probabilities (and otherwise dened precisely as the GL field); intended to store imputed genotype probabilities (Floats) "

	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ].
	self formatStream nextPutAll: 'GP'
