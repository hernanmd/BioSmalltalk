accessing-blast-meta
blastQueryDef
	" Answer a String with the query definition line of the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents ) 
			at: 'BlastOutput_query-def'

	