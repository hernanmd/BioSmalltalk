accessing
executeCommand: aCommandName
	" See superimplementor's comment "
	
	^ ((self classFor: self providerClass) command: aCommandName) output.