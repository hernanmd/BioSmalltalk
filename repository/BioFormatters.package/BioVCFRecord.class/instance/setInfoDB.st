accessing - info
setInfoDB
	" Set dbSNP membership "

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream 
		nextPutAll: 'DB'