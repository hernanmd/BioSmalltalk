accessing
markers

	^ markers
		ifNil: [ self initializeMarkers.
			markers ]