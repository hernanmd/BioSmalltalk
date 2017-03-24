accessing - custom track header
addCTrackColor: colorCollection
	" Sets the default visibility mode for this track. 
	colorCollection must have 3 <Color> instances "

	| rgbColors |
	
	rgbColors := colorCollection joinUsing: $,.
	self properties
		propertyAt: 'color'
		put: rgbColors