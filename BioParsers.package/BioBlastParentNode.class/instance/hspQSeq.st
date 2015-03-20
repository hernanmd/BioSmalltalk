accessing hit individually
hspQSeq
	" Answer a <String> of receiver's alignment strings (for the query, this is the originally sent by the Blast user) "
	
	^ self selectNodeNamed: 'Hsp_qseq'.
