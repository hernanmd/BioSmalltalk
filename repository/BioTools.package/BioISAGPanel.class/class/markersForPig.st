accessing - pig
markersForPig
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies at: 'pig') 
		collect: [ : markerInfo | 			
			(BioMicrosatelliteLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]