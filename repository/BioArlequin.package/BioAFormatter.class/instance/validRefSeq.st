testing
validRefSeq
	" Answer <true> if receiver's seqRef is valid "
	
	^ self refSeq isNil not and: [ self refSeq isEmpty not ]