accessing
nucleotidePenalty: aSmallInteger
	" Penalty for a nucleotide mismatch (blastn only) "
	
	self clientUrl queryAt: 'NUCL_PENALTY' put: aSmallInteger asString