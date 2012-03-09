accessing-blast-meta
blastQueryId
	" Answer a String with the query ID of the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_query-ID'

	