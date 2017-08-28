*BioFormatters
containsSequenceString
	" Answer <true> if the receiver has a sequence <String> "
	
	^ self anySatisfy: #isBiologicalSequence.