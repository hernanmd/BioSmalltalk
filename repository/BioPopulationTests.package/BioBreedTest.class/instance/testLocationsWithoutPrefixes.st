tests-text-mining
testLocationsWithoutPrefixes

	self population
		addLocation: 'SE Mexico';
		addLocation: 'N Portugal';
		addLocation: 'China'.
	self assert: (self population locationsWithoutPrefixes bioHasEqualElements: #('Mexico' 'Portugal' 'China'))