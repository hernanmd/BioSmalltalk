accessing hsps
hspMidLines
	" Answer a Collection of receiver's formatting middle lines as normally seen in BLAST report "
	
	^ self selectNodesNamed: 'Hsp_midline'.
