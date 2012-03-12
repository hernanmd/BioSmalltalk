eUtilities-fetch
entrezFetchSample03
	" Outputs an TXT with information "
	
	| result |
	
	result := 
		BioEntrezClient new pubmed 
			uids: #( 11877539 11822933 );
			setModeText;
			fetch.
	result outputToFile: 'eFetch1.txt'

