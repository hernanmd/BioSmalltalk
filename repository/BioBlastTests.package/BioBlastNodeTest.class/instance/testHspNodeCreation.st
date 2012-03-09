testing
testHspNodeCreation

	self assert: ( ( BioBlastNode nodeFor: 'Hsp_num' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_bit-score' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_score' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_evalue' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_query-from' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_query-to' ) isKindOf: BioBlastNode ).		
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_hit-from' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_hit-to' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_query-frame' ) isKindOf: BioBlastNode ).		
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_hit-frame' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_identity' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_positive' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_gaps' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_align-len' ) isKindOf: BioBlastNode ).		
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_qseq' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_hseq' ) isKindOf: BioBlastNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp_midline' ) isKindOf: BioBlastNode ).	


	
	
	
       		
	
