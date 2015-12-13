accessing
executeCommand: aCommandName
	" Execute aCommandName. Answer an empty <String> if aCommandName is not found, otherwhise answer the aCommandName output "

	^ self adapterClass executeCommand: aCommandName