testing
testEmptyNodeCreation

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



	
	
	
       		
	
