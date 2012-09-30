accessing-sequence
copySeqTo: stopInteger
	" See comment in BioSequence. Answer the receiver "
	
	self sequence: (self sequence copyTo: stopInteger)