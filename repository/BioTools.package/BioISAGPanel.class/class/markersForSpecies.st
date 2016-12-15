accessing
markersForSpecies
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ Dictionary new
		at: 'cattle' 	put: self markerAlleleRangesForCattle;
		at: 'dog' 		put: self markerAlleleRangesForDog;
		at: 'sheep' 		put: self markerAlleleRangesForSheep;
		at: 'goat' 		put: self markerAlleleRangesForGoat;
		at: 'pig' 		put: self markerAlleleRangesForPig;
		yourself