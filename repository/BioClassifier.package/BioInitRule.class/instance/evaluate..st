accessing
evaluate: aCollection
	" See superimplementor's comment "

	aCollection 
		do: [ : subject | 
			(self condition value: subject)
				ifTrue: [ self nextTrue evaluate: subject ]
				ifFalse: [ self nextFalse evaluate: subject ] ]
		displayingProgress: 'Classifying'