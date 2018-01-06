accessing - sheep
markersForSheep
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'sheep') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]