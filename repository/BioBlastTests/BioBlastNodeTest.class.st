Class {
	#name : #BioBlastNodeTest,
	#superclass : #BioAbstractTest,
	#category : 'BioBlastTests-Core'
}

{ #category : #testing }
BioBlastNodeTest >> testEmptyNodeCreation [

	self assert: ( ( BioBlastNode nodeFor: 'Hit' ) isKindOf: BioBlastParentNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_hsps' ) isKindOf: BioBlastParentNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hsp' ) isKindOf: BioBlastParentNode ).
	"self assert: ( ( BioBlastNode nodeFor: 'Iteration_hits' ) isKindOf: BioBlastParentNode )."
	"self assert: ( ( BioBlastNode nodeFor: 'Iteration' ) isKindOf: BioBlastParentNode ).
	self assert: ( ( BioBlastNode nodeFor: 'BlastOutput_iterations' ) isKindOf: BioBlastParentNode ).		
	self assert: ( ( BioBlastNode nodeFor: 'BlastOutput_param' ) isKindOf: BioBlastParentNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Parameters' ) isKindOf: BioBlastParentNode ).
	self assert: ( ( BioBlastNode nodeFor: 'BlastOutput' ) isKindOf: BioBlastParentNode ).		
	self assert: ( ( BioBlastNode nodeFor: 'Iteration_stat' ) isKindOf: BioBlastParentNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Statistics' ) isKindOf: BioBlastParentNode )."



	
	
	
       		
	

]

{ #category : #testing }
BioBlastNodeTest >> testHitNodeCreation [

	self assert: ( ( BioBlastNode nodeFor: 'Hit_num' ) isKindOf: BioBlastHitNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_id' ) isKindOf: BioBlastHitNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_def' ) isKindOf: BioBlastHitNode ).	
	self assert: ( ( BioBlastNode nodeFor: 'Hit_accession' ) isKindOf: BioBlastHitNode ).
	self assert: ( ( BioBlastNode nodeFor: 'Hit_len' ) isKindOf: BioBlastHitNode ).


	
	
	
       		
	

]

{ #category : #testing }
BioBlastNodeTest >> testHspNodeCreation [

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


	
	
	
       		
	

]
