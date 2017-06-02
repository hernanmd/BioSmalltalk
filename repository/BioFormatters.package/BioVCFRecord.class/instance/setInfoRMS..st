accessing - info
setInfoRMS: aNumber
	" Set aNumber of RMS mapping quality "

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info
		nextPutAll: 'RMS=';
		nextPutAll: aNumber asString 