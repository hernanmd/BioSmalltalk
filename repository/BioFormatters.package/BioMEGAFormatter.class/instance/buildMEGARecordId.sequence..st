private
buildMEGARecordId: seqName sequence: seqString

	^ BioMEGASeqRecord new
		name: seqName;
		alignment: (self formatSequenceFrom: seqString);
		yourself