accessing
removeSearchResult: aGTSearchResult
	" Remove aGTSearchResult from the receiver's sequences "

	self sequences 
		remove: aGTSearchResult
		ifAbsent: [ self signalNotFound: aGTSearchResult name ]