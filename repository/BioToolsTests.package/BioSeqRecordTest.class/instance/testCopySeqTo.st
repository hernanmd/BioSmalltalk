testing
testCopySeqTo

	| editedSeqRecord |
	
	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'MKQHKAMIVALIVICITAVVAALVTRKDLCEVHIRTGQTEVAVF').
	seqRecord
		id: 'YP_025292.1';
		description: 'toxic membrane protein'.
	
	editedSeqRecord := seqRecord copySeqTo: 9.
	self assert: (editedSeqRecord isKindOf: BioSeqRecord).
	self assert: seqRecord sequence asString equals: 'MKQHKAMIV'
