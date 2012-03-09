accessing-blast-filters
hitAccessionsAsString
	" Answer a Collection with the accession Strings from the receiver's results "

	^ self hitIdentifiers collect: [: id | ( BioParser parseAccession: id value ) asString ]
