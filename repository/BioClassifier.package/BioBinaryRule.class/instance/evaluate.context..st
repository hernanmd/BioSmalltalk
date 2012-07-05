accessing
evaluate: subject context: aContext

	( self condition value: subject value: aContext )
		ifTrue: [ self nextTrue evaluate: subject context: aContext ]
		ifFalse: [ self nextFalse evaluate: subject context: aContext ]