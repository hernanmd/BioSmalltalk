accessing-blast-filters
collectFilters
	" Answer a <Collection> with all joined filters "

	^ BioBlastFilter newFromCollection: (self filters flatCollect: [ : e | e ] )