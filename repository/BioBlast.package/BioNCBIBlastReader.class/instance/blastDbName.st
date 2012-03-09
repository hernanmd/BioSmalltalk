accessing-blast-meta
blastDbName
	" Answer a String with the database name used to perform the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents )
			at: 'BlastOutput_db'

	