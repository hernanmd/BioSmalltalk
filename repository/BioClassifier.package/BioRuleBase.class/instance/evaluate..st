accessing
evaluate: aCollection

	^ self rules do: [: rule | 
		rule 
			evaluate: aCollection 
			context: self ]