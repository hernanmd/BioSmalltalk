running
scan: input

	^self new
		onStream: input readStream;
		allTerms