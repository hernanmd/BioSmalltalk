as yet unclassified
make: outputFormat

	^ self 
		do: [self makeNoWait: outputFormat]
		blockUntilFileUpdated: (self outputPath, ':', self baseFileName, '.', outputFormat)
		waitingNoMoreThan: self durationToWaitForGenerating