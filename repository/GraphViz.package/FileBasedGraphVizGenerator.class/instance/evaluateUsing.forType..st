generating
evaluateUsing: externalProgram forType: outputFormat

	self
		runOSProcess: externalProgram 
		with: (self commandLineForFormat: outputFormat)