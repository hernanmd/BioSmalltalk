eUtilities-info
entrezInfoSample01
	" Outputs an XML with information about PubMed database "
	
	| result |
	
	result := BioEntrezClient new pubmed info.
	result outputToFile: 'eInfo1.xml'

