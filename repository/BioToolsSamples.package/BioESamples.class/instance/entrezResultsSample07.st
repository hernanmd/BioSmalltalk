eUtilities-search-fetch
entrezResultsSample07
	" 
	1) Search a gene by accession and get the FASTA sequence from the Nuccore database
	2) With the same accession retrieve the GenBank file
	"

	| searchResult1 searchResult2 |

	searchResult1 := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			useWebEnv;
			setFasta;			
			fetch.

	searchResult1 
		outputToFile: 'searchFASTANuccore7.fasta'.
		
	searchResult2 := 
		searchResult1 client nuccore
			setGb;
			fetch.
			
	searchResult2 
		outputToFile: 'searchGbNuccore7.gb'.
