accessing
evaluate: aCollection context: aContext

	aCollection 
		do: [: subject | 
			"self haltIf: [ subject at: #country ifPresent: [ : s | s asLowercase = 'argentina' ] ifAbsent: [ false ] ]."
			(self condition value: subject value: aContext)
				ifTrue: [ self nextTrue evaluate: subject context: aContext ]
				ifFalse: [ self nextFalse evaluate: subject context: aContext ] ]
		displayingProgress: 'Classifying'