accessing-blast-meta
blastQueryLength
	" Answer a String with the query length of the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_query-len'

	