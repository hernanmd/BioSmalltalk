accessing hsps
hspBitScores
	" Answer a Collection of receiver's scores (in bits) of the HSPs "
	
	^ self selectNodesNamed: 'Hsp_bit-score'.
