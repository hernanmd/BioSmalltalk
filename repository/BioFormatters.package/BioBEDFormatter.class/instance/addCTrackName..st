accessing - custom track header
addCTrackName: aString
	" Add description name (for custom track displayed in the Genome Browser)"

	self properties
		propertyAt: 'track name'
		put: (aString surroundedBy: '"')