testing
testCopySeqFrom

	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'MKQHKAMIVALIVICITAVVAALVTRKDLCEVHIRTGQTEVAVF' ).
	seqRecord
		id: 'YP_025292.1';
		description: 'toxic membrane protein'.
	
	self assert: ( ( seqRecord copySeqFrom: 9 ) isKindOf: BioSeqRecord ).
	self assert: seqRecord sequence asString = 'VALIVICITAVVAALVTRKDLCEVHIRTGQTEVAVF'
