removing
removeStopwords

	documents do: [ :each |
		each removeSpanishStopwords ]