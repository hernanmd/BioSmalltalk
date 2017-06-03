accessing - info
setInfoRMS: aNumber
	" Set aNumber of RMS mapping quality "

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream
		nextPutAll: 'RMS=';
		nextPutAll: aNumber asString 