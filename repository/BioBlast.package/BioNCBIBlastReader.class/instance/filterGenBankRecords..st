accessing-entrez
filterGenBankRecords: aBlock
	" On-Line version. Answer a Collection of SeqRecords "
	
	| gbReader |
	
	self halt.
	gbReader := BioNCBIGenBankReader new selectGenBankRecords: self lastResult result.
	^ gbReader contents select: [: seqRecord | aBlock value: seqRecord ].