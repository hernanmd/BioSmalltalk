testing
testCreate

	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'ACGT').
	
	self assert: (seqRecord isKindOf: BioSeqRecord).
	self assert: (seqRecord sequence isKindOf: BioSequence).
	self assert: seqRecord sequence asString equals: 'ACGT'.
	self assert: seqRecord id equals: seqRecord nullName.
	
	seqRecord := BioSeqRecord new: (BioUnknownSeq new: 20).
	
	self assert: (seqRecord sequence isKindOf: BioUnknownSeq).
	self assert: seqRecord sequence size equals: 20.
	self assert: seqRecord sequence asString equals: 'NNNNNNNNNNNNNNNNNNNN'.
	