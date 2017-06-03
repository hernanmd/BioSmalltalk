accessing - format
setFormatGQ
	" Set the conditional genotype quality, encoded as a phred quality 10log10 p (genotype call is wrong, conditioned on the site's being variant) (Integer) "

	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ].
	self formatStream nextPutAll: 'GQ'
