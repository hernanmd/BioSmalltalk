eUtilities-fetch
entrezFetchSample04
	" Outputs a Fasta file for a list of accession numbers "
	
	| result |
	
	result := BioEntrezClient new nuccore
				uids: #('AB177765.1' 'AB177791.1');
				setFasta;
				fetch.
	result dumpToFileNamed: 'nuccore_seqs.fasta'

