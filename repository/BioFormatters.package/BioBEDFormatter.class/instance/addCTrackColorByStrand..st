accessing - custom track header
addCTrackColorByStrand: colorCollection
	" Sets the default visibility mode for this track. 
	colorCollection must have 6 <Color> instances "

	| plusStrand minorStrand |
	
	plusStrand := ((colorCollection first: 3) collect: #asRGBInteger) joinUsing: $,.
	minorStrand := ((colorCollection last: 3) collect: #asRGBInteger) joinUsing: $,.
	self properties
		propertyAt: 'colorByStrand'
		put: plusStrand , ' ' , minorStrand