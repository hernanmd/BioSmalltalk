testing
testSequence

	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	self assert: seqRecord sequence asString = 'ACGT'.
	seqRecord sequence: 'tcga'.
	self assert: seqRecord sequence asString = 'tcga'.