testing
testHitNodeCreation

	self assert: ( ( BioBlastNode nodeFor: 'Hit_num' ) isKindOf: BioBlastHitNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_id' ) isKindOf: BioBlastHitNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_def' ) isKindOf: BioBlastHitNode ).	
	self assert: ( ( BioBlastNode nodeFor: 'Hit_accession' ) isKindOf: BioBlastHitNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_len' ) isKindOf: BioBlastHitNode ).


	
	
	
       		
	
