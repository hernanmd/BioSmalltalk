accessing
evaluate: subject

	(super evaluate: subject)
		ifTrue: [ self nextTrue evaluate: subject ]
		ifFalse: [ self nextFalse evaluate: subject ]