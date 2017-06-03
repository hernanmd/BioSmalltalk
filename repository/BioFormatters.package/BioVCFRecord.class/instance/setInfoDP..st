accessing - info
setInfoDP: aNumber
	" Set aNumber of combined depth across samples"

	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ].
	self infoStream 
		nextPutAll: 'DP=';
		nextPutAll: aNumber asString 