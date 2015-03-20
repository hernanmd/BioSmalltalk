testing
testEquality

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).

	self assert: ( seqRecord isKindOf: BioSeqRecord ).
	self assert: ( seqRecord sequence isKindOf: BioSequence ).
	self assert: seqRecord sequence asString = 'ACGT'.

	tmpSeqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACTG' ).
	self deny: tmpSeqRecord = seqRecord description: 'Test different sequence'.
	
	tmpSeqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	tmpSeqRecord id: 'Test2'.
	self deny: tmpSeqRecord = seqRecord description: 'Test different id'.