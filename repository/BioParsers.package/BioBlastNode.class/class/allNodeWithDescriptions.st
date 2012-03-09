accessing
allNodeWithDescriptions
	" Answer a Collection with all the BLAST XML node names with descriptions "

	| answer |
	
	answer := Dictionary new.
	( self allContentSubclasses collect: [ : cls  | cls nodesWithDescriptions ] ) 
		do: [: each | answer addAll: each ].
	^ answer

