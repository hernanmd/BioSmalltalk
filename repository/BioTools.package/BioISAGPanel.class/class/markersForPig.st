accessing - pig
markersForPig
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'pig') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]