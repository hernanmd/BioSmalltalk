accessing - format
appendFormatDelimiter
	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ]