removing
removeStopwords: stopwords

	stopwords do: [ :each |
		
		contents removeKey: each ifAbsent: nil]