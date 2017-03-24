accessing - custom track header
addCTrackColorByStrand: colorCollection
	" Sets the default visibility mode for this track. 
	colorCollection must have 6 <Number> RGB instances "

	| plusStrand minorStrand |
	
	plusStrand := (colorCollection first: 3) joinUsing: $,.
	minorStrand := (colorCollection last: 3) joinUsing: $,.
	self properties
		propertyAt: 'colorByStrand'
		put: ((plusStrand , ' ' , minorStrand) surroundedBy: '"')