accessing public
webEnv: aBioESearchResult
	" Set the receiver's web environment and query key from aGETSearchResult "
	
	^ self url
		queryKey: aBioESearchResult queryKey first;
		webEnv: aBioESearchResult webEnv first