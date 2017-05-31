eUtilities-search-fetch
entrezSearchFetchExample08
	" 
	Download and save into a FASTA file the d-loop sequence for Sheep
	"

	(BioEntrezClient new nuccore
		webEnv: (BioEntrezClient new nuccore
			term: 'L29055';
			setUseHistory;
			search);
		setFasta;
		fetch) dumpToFileNamed: 'e-nuccore-sheep-dloop.fa'.