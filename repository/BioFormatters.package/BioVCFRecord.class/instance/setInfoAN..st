accessing - info
setInfoAN: aNumber
	" Set aNumber of total number of alleles in called genotypes "

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info 
		nextPutAll: 'AN=';
		nextPutAll: aNumber asString 