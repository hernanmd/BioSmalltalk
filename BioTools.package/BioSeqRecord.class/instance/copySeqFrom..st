accessing-sequence
copySeqFrom: startInteger
	" See comment in BioSequence. Answer the receiver "
	
	self sequence: (self sequence copyFrom: startInteger)