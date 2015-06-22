eUtilities-summary
entrezSummarySample02
	" Outputs an XML with information about summaries "
	
	| result |
	
	result := 
		BioEntrezClient new protein 
			uids: #( 6678417 9507199 );
			summaryAlternative.
	result dumpToFileNamed: 'eSummary_alternative.xml'

