accessing - info
setInfoH2
	" Set hapmap2 membership "

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info 
		nextPutAll: 'H2'