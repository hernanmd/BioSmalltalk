accessing hit individually
hspHSeq
	" Answer a <String> of receiver's alignment strings (for the database) nodes in each HSP node "
	
	^ self selectNodeNamed: 'Hsp_hseq'.
