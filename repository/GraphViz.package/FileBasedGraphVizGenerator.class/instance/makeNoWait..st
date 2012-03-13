generating
makeNoWait: outputFormat

	self writeDotFile.
	self evaluateUsing: self preferredProgram forType: outputFormat.
	
	^ self outputFileNameFor: outputFormat