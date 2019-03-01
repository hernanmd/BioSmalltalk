accessing-columns
buildPositionSubset
	" Answer a <Collection> with position based (chr and start) subset "

	^ self sortByColumnsAt: { 
		self indexOfProbesetId . 
		self indexOfChr .
		self indexOfChrStart }