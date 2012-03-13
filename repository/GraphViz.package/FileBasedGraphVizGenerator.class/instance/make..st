generating
make: outputFormat

	^ self 
		do: [self makeNoWait: outputFormat]
		blockUntilFileUpdated: (self outputFileNameFor: outputFormat)
		waitingNoMoreThan: self durationToWaitForGenerating