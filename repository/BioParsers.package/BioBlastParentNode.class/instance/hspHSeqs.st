accessing hsps
hspHSeqs
	" Answer a Collection of receiver's alignment strings (for the database) nodes in each HSP node "
	
	^ self selectNodesNamed: 'Hsp_hseq'.
