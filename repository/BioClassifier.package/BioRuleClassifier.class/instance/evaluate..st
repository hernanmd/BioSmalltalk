accessing
evaluate: aCollection

	^ self ruleSet do: [: rule | 
		rule 
			evaluate: aCollection 
			context: self ]