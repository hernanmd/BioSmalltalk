accessing - info
setInfoAN: aNumber
	" Set aNumber of total number of alleles in called genotypes "

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream 
		nextPutAll: 'AN=';
		nextPutAll: aNumber asString 