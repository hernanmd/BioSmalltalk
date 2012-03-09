accessing
accessionsWithVersion

	^ self collect: [: d | d at: 'GBSeq_accession-version' ]