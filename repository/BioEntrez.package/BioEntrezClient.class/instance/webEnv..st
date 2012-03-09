accessing public
webEnv: aGTESearchResult
	" Set the receiver's web environment and query key
	from aGETSearchResult "
	
	^ self url
		queryKey: aGTESearchResult queryKey;
		webEnv: aGTESearchResult webEnv