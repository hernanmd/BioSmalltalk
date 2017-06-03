accessing - format
setFormatMQ
	" Set the RMS mapping quality, similar to the version in the INFO field. (Integer) "

	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ].
	self formatStream nextPutAll: 'MQ'
