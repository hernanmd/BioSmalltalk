eUtilities-summary
entrezSummarySample01
	" Outputs an XML with information about summaries "
	
	| result |
	
	result := 
		BioEntrezClient new protein 
			uids: #( 6678417 9507199 );
			summary.
	result dumpToFileNamed: 'eSummary1.xml'

