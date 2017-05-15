accessing
markersForSpecies
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ Dictionary new
		at: 'cattle' 	put: self markerAlleleRangesForCattle;
		yourself