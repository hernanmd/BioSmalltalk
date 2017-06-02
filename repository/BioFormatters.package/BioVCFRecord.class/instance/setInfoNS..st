accessing - info
setInfoNS: aNumber
	" Set aNumber of samples with data"

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info
		nextPutAll: 'NS=';
		nextPutAll: aNumber asString 