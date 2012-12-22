accessing
executeCommand: aCommandName parameter: parameterName
	" See superimplementor's comment "

	^ ((self classFor: self providerClass) 
			command: aCommandName , String space , parameterName) output.