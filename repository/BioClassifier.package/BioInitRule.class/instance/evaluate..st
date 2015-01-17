accessing
evaluate: aCollection

	aCollection 
		do: [: subject | 
			"self haltIf: [ subject at: 'GBSeq_accession-version' ifPresent: [ : s | s = 'FJ014460.1' ] ifAbsent: [ false ] ]."
			"self haltIf: [ subject at: #country ifPresent: [ : s | s asLowercase = 'china: beijing' ] ifAbsent: [ false ] ]."
			(self condition value: subject)
				ifTrue: [ self nextTrue evaluate: subject ]
				ifFalse: [ self nextFalse evaluate: subject ] ]
		displayingProgress: 'Classifying'