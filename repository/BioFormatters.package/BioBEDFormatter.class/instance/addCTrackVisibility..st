accessing - custom track header
addCTrackVisibility: aNumber
	" Sets the default visibility mode for this track. "

	self properties
		propertyAt: 'visibility'
		put: aNumber asString