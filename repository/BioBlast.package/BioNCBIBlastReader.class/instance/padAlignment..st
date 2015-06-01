accessing-blast
padAlignment: aCollection
	" Answer a <Collection> of receiver's alignment (for the database) in each receiver's HSP node.
	The case for sequences which are not completely aligned are handled this way:
	1) For #hspQueryFrom not starting at 1: Left pad with a Missing Character Symbol
	2) For #hspQueryTo less than #refSeqSize: Right pad with Missing Character Symbol 
	3) For #hspQueryTo greater than #refSeqSize: Not handled for now (ToDo) "
	
	aCollection do: [ : gbDictionary | 
		gbDictionary 
			at: 'Padded_sequence' 
			put: (self padAlignmentIn: (gbDictionary at: 'BlastNode')) ].
	^ aCollection