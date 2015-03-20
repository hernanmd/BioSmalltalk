accessing
queryFilters
	^ queryFilters
		ifNil: [ queryFilters := OrderedCollection new ]