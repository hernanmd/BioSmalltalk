accessing
saveSplittedSearchResults: dir
	self entrezSearchResults
		doWithIndex: [ :bioESearchResult :index | 
			| fileName |
			fileName := self formatFilename: dir index: index.
			self dumpToFileNamedFullPath: fileName contents: bioESearchResult ]