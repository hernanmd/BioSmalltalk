removing
removeStopwords: stopwordList

	^self rejectTermRow: [ :term :row | 
		stopwordList includes: term asString ]