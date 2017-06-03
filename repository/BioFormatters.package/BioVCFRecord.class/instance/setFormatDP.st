accessing - format
setFormatDP
	" Set read depth at this position for this sample (Integer) "

	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ].
	self formatStream nextPutAll: 'DP'
