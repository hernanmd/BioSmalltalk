accessing
parserForLocus
	" Answer a parser for parsing locus identifiers "

	^ $| asParser optional , self parserForNonFastaString plus flatten