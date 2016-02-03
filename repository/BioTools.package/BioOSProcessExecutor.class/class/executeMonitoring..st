accessing
executeMonitoring: aCommandName
	" See superimplementor's comment "
	
	| p |
	
	p := (self classFor: self providerClass) command: aCommandName.
	[ p isComplete ] whileFalse: [
		(Delay forSeconds: self monitoringDelay) wait.
		self notifyExecutionProgress ].
	^ p output
	