accessing
searchResults

	^ searchResults
		ifNil: [ searchResults := OrderedCollection new ]