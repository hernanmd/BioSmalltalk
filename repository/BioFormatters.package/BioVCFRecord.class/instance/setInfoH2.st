accessing - info
setInfoH2
	" Set hapmap2 membership "

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream 
		nextPutAll: 'H2'