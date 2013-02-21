*bioparsers
asBlastParameter

	^ self isNumeric
		ifTrue: [ self asNumber ]
		ifFalse: [ self asLowercase ]