accessing - info
setInfoH3
	" Set hapmap3 membership "

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream 
		nextPutAll: 'H3'