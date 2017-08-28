*BioFormatters
isValidForFastaFormat
	" Answer <true> if the receiver has enough data to be translated to Fasta format "

	^ self containsSequenceId and: [ self containsSequenceString ].