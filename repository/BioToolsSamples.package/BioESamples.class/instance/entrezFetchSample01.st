eUtilities-fetch
entrezFetchSample01
	" self new entrezFetchSample01 "

	| result |
	
	result := BioEntrezClient new nuccore
				uids: #(12800);
				setModeText;
				fetch.
	result outputToFile: 'searchNuccore1.txt'

