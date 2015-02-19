private
buildMEGARecordId: seqName sequence: seqString
	" Answer a new MEGA record formatted for valid export to text file "
	
	^ BioMEGASeqRecord new
		name: (self formatNameFrom: seqName);
		alignment: (self formatSequenceFrom: seqString);
		yourself