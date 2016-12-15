accessing - sheep
markersForSheep
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies at: 'sheep') 
		collect: [ : markerInfo | 			
			(BioMicrosatelliteLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]