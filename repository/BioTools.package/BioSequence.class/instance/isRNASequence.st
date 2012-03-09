testing
isRNASequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ seq isRNASequence and: [ self alphabet isRNA ]