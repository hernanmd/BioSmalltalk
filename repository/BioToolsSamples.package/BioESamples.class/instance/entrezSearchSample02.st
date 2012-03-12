eUtilities-search
entrezSearchSample02
	" Using a client to get a Collection of Gene Identifiers 
	from an Entrez search result (not provided = search is performed).
	Does NOT use the remote web environment and query key "

	| searchResult |

	searchResult := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			search.
	^ searchResult idList.