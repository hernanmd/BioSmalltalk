accessing - cattle
markersForCattle
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies at: 'cattle') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]