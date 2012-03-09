instance creation
newFrom: aSearchResult

	^ self new
		searchResults: aSearchResult;
		results: aSearchResult reader results;
		yourself