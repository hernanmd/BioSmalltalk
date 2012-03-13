accessing
addSearchResults: anObject
	" Add aGTResults to the receiver's results. 
	Answer the newly created search result "
	
	^ ( self createSearchResultFrom: anObject ) addToProject: self
