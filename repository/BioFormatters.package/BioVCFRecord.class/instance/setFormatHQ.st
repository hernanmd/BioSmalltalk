accessing - format
setFormatHQ
	" Set the haplotype qualities, two comma separated phred qualities (Integers) "

	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ].
	self formatStream nextPutAll: 'HQ'
