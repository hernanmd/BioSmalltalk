accessing - info
setInfoDP: aNumber
	" Set aNumber of combined depth across samples"

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'DP=';
		nextPutAll: aNumber asString 