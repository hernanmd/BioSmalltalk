accessing
conditions
	^ conditions
		ifNil: [ conditions := OrderedDictionary new ]