initialize-release
initialize

	termMap := BidirectionalMap new.
	documentMap := BidirectionalMap new.
	localWeighting := TermFrequency new.
	globalWeighting := InverseDocumentFrequency new.