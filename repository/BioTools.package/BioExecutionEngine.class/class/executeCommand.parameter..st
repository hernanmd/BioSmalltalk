accessing
executeCommand: aCommandName parameter: parameterName
	" Execute aCommandName with parameterName, Answer an empty String if aCommandName is not found , otherwhise answer the aCommandName output "
	
	^ self adapterClass executeCommand: aCommandName parameter: parameterName