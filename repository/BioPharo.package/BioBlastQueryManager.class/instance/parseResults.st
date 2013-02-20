accessing
parseResults

	^ parseResults
		ifNil: [parseResults := OrderedCollection new]