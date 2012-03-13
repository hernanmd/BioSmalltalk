accessing private
createSearchResultFrom: aString
	" Answer a new search result for aString "
	
	^ BioSearchResult new
		project: self;
		result: aString;
		yourself