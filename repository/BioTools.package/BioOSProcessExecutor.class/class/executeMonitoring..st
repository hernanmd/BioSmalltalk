accessing
executeMonitoring: aCommandName
	" See superimplementor's comment "
	
	| p |
	
	p := (self classFor: self providerClass) command: aCommandName.
	[ p isComplete ] whileFalse: [ Transcript show: Time now asString , ' executing' ].
	^ p output
	