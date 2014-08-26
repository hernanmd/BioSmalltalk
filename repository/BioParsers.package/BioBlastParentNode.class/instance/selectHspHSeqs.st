accessing hsps
selectHspHSeqs
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHSeqs collect: #blastValue
