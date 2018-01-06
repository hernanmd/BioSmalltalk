accessing - cattle
markersForCattle
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'cattle') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]