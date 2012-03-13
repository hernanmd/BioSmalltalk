accessing
unMatchedConditions

	^ misses
		ifNil: [ misses := Dictionary new ]