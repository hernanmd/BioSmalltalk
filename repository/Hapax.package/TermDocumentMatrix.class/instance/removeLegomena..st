removing
removeLegomena: threshold

	^self rejectTermRow: [ :term :row |
		(globalWeighting documentFrequency: row) <= threshold ]