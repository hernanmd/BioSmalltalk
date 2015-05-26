accessing-blast
paddedAlignments
	" Answer a <Collection> of receiver's alignment (for the database) in each receiver's HSP node.
	The case for sequences which are not completely aligned are handled this way:
	1) For #hspQueryFrom not starting at 1: Left pad with a Missing Character Symbol
	2) For #hspQueryTo less than #refSeqSize: Right pad with Missing Character Symbol 
	3) For #hspQueryTo greater than #refSeqSize: Not handled for now (ToDo) "
	
	| align filteredResults |
	
	align := BioAlignment new.
	filteredResults := self contents result.
	filteredResults result collect: [ : eachHit | 
		align addSequence: ( 
			BioSequence 
				newNamed: eachHit hitAccessions 
				sequence: (self padAlignmentIn: eachHit)) ].
	^ align