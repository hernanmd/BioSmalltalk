accessing
nucleotidePenalty: aSmallIntegerString
	" Penalty for a nucleotide mismatch (blastn only) "
	
	self clientUrl addParameters: 'NUCL_PENALTY=' , aSmallIntegerString