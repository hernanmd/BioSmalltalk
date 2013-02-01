accessing
comparators
	^ Comparators
		ifNil: [ self initializeComparators ]