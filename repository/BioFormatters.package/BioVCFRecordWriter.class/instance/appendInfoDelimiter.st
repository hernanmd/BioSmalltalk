accessing - info
appendInfoDelimiter
	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ]