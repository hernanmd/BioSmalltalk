accessing - info
setInfoDB
	" Set dbSNP membership "

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info 
		nextPutAll: 'DB'