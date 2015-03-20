accessing
resultSizeInMb
	" Answer the size of the result set in Megabytes "

	| answer |
	
	^ ( answer := ( contents sum: #size ) / 1048576 ) asInteger = 0
		ifTrue: [ answer asFloat roundTo: 0.01 ]