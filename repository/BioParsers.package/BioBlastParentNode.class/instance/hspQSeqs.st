hsps accessing
hspQSeqs
	" Answer a Collection of receiver's alignment strings (for the query, this is the originally sent by the Blast user) "
	
	^ self selectNodesNamed: 'Hsp_qseq'.
