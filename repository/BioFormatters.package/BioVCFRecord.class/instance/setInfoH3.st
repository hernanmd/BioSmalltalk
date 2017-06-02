accessing - info
setInfoH3
	" Set hapmap3 membership "

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info 
		nextPutAll: 'H3'