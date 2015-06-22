eUtilities-fetch
entrezFetchSample03
	" Outputs an XML with information "
	
	| result |
	
	result := 
		BioEntrezClient new pubmed 
			uids: #( 11877539 11822933 );
			setModeXML;
			fetch.
	result dumpToFileNamed: 'eFetch1.xml'

