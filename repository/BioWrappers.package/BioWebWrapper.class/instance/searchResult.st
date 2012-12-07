accessing public
searchResult
	" Answer a search result object "
	
	^ searchResult
		ifNil: [ searchResult := self searchResultClass newFrom: self ].