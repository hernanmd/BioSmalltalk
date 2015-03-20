testing
isDNASequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ seq isDNASequence and: [ self alphabet isDNA ]