accessing
generateOutput
	" Answer a String with the final receiver's contents "
	
	self addPopulations.
	^ self outputFile contents
