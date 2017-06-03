accessing - format
setFormatPL
	" Set the phred-scaled genotype likelihoods rounded to the closest integer (and otherwise defined precisely as
the GL field) (Integers) "

	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ].
	self formatStream nextPutAll: 'PL'
