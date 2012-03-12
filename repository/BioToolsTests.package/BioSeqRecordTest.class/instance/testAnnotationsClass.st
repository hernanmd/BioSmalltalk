testing
testAnnotationsClass

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	seqRecord annotations: ( Dictionary new at: 'evidence' put: 'Invented evidence'; yourself ).
	
	self assert: ( seqRecord annotationsClass isKindOf: Behavior ).
	