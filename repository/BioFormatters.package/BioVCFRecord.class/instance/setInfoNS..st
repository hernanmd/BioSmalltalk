accessing - info
setInfoNS: aNumber
	" Set aNumber of samples with data"

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream
		nextPutAll: 'NS=';
		nextPutAll: aNumber asString 