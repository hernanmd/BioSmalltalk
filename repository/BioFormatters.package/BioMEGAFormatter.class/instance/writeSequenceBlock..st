private
writeSequenceBlock: aBioMEGASeqRecord

	self stream 
		nextPut: $#;
		nextPutAll: aBioMEGASeqRecord name;
		cr.
