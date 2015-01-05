*BioFormatters
containsSequenceId
	" Answer <true> if the receiver has a <String> which serves as identifier "
	
	^ self anySatisfy: #isString