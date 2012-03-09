accessing-blast-filters
hitAccessions
	" Answer a Collection with the accession objects from the receiver's results "

	^ self hitIdentifiers collect: [: id | BioParser parseAccession: id value ]
