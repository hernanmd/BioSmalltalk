accessing
evaluate: subject context: aContext

	(super evaluate: subject context: aContext)
		ifTrue: [ self nextTrue evaluate: subject context: aContext ]
		ifFalse: [ self nextFalse evaluate: subject context: aContext ]