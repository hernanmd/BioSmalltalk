removing
removeStopwords

	documents do: [ :each |
		each removeEnglishStopwords ]