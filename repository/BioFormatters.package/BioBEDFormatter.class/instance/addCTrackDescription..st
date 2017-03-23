accessing - custom track header
addCTrackDescription: aString
	" Add a description for custom tracks "

	self properties
		propertyAt: 'description'
		put: (aString surroundedBy: '"')