eUtilities-fetch
entrezFetchSample02
	" Outputs a GenBank file for a list of GenBank identifiers "
	
	| result |
	
	result := BioEntrezClient new nuccore
				uids: #(57240072 57240071 6273287 6273291 6273290 6273289 6273286 6273285 6273284);
				setGb;
				fetch.
	result outputToFile: 'fetchNuccore3.gb'

