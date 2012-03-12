eUtilities-search-fetch
entrezResultsSample06
	" 
	Simplify the use of the history server. 
	Search a gene and get the FASTA sequence from the Nuccore database
	"

	| searchResult |

	searchResult := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			useWebEnv;
			setFasta;			
			fetch.

	searchResult 
		outputToFile: 'searchFASTANuccore4.fasta'.