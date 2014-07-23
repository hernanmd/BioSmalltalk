tests-text-mining
testLocationsWithoutPrefixes

	pop 
		addLocation: 'SE Mexico';
		addLocation: 'N Portugal';
		addLocation: 'China'.
	self assert: (pop locationsWithoutPrefixes bioHasEqualElements: #('Mexico' 'Portugal' 'China'))