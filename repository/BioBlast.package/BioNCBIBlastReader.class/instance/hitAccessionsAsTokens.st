accessing-blast-filters
hitAccessionsAsTokens
	" Answer a Collection with the accession numbers tokenized from the receiver's results "

	^ self hitIdentifiers collect: [: id | BioParser tokenizeAccession: id value ]