accessing hits
hitAccessions
	" Answer a <Collection> of receiver's accession of the database sequence (e.g., 'AAF57408.1')
	Note: This method parses dhe accession number from the HIT identifier, not from the Hit_accession node "

	^ (BioParser tokenizeAccession: (self selectNodeNamed: 'Hit_id') blastValue) joinUsing: '.'.
