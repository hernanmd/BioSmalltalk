accessing
allNodeNames
	" Answer a Collection with all the BLAST XML node names "

	^ ( self allContentSubclasses collect: [ : cls | cls nodeNames ] ) joinUsing: Array new
