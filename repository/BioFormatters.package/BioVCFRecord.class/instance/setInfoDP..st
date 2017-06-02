accessing - info
setInfoDP: aNumber
	" Set aNumber of combined depth across samples"

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info 
		nextPutAll: 'DP=';
		nextPutAll: aNumber asString 