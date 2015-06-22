eUtilities-info
entrezInfoSample01
	" Outputs an XML with information about PubMed database "
	
	| result |
	
	result := BioEntrezClient new pubmed info.
	result dumpToFileNamed: 'eInfo1.xml'

