accessing
executeMonitoring: aCommandName
	" Execute aCommandName monitoring its output. Answer an empty <String> if aCommandName is not found, otherwhise answer the aCommandName output "

	^ self adapterClass executeMonitoring: aCommandName