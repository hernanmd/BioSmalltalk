accessing - custom track header
addCTrackUseScore: aNumber

	self properties
		propertyAt: 'useScore'
		put: aNumber asString