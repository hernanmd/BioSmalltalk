accessing-blast-meta
blastProgramName
	" Answer a String with the program name used to perform the BLAST "

	^ ( self 
		selectHeaderNodesIn: self headerContents )
			at: 'BlastOutput_program'

	