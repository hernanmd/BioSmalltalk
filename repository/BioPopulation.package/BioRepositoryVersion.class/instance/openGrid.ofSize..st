accessing
openGrid: breedMatrix ofSize: aNumber

	| grid |
	
	grid := ( GridMorph 
			from: breedMatrix
			performing: {
				'Names' -> #first .
				'Synonyms' -> #second .
				'Locations' -> #third } ) 
				title: 'Browsing ' , aNumber asString , ' species' translated.
	grid 
		openInWorld;
		layoutChanged.