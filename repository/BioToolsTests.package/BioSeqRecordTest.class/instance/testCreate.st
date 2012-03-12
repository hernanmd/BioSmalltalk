testing
testCreate

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	
	self assert: ( seqRecord isKindOf: BioSeqRecord ).
	self assert: ( seqRecord sequence isKindOf: BioSequence ).
	self assert: seqRecord sequence asString = 'ACGT'.
	self assert: seqRecord id = seqRecord nullName.
	
	seqRecord := BioSeqRecord new: ( BioUnknownSeq new: 20 ).
	
	self assert: ( seqRecord sequence isKindOf: BioUnknownSeq ).
	self assert: seqRecord sequence size = 20.
	self assert: seqRecord sequence asString =  'NNNNNNNNNNNNNNNNNNNN'.
	