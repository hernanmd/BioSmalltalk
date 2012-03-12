eUtilities-fetch
entrezFetchSample01
	" self new entrezClientSample01 "

	| result |
	
	result := BioEntrezClient new nuccore
				uids: #(12800);
				setModeXML;
				setModeText;
				fetch.
	result outputToFile: 'searchNuccore1.txt'

