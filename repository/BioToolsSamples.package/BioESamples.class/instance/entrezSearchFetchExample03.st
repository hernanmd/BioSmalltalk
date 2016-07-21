eUtilities-search-fetch
entrezSearchFetchExample03
	" 
	1) Using a client to search a gene and get a Collection of Gene Identifiers from the Nuccore database
	2) Use the obtained gene id's to fetch the results from the Nuccore database
	Does NOT use the remote web environment and query key 
	"

	| searchResult1 searchResult2 |

	searchResult1 := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			search.

	searchResult2 := BioEntrezClient new nuccore
		uids: searchResult1 idList;
		setFasta;
		fetch.

	searchResult2 
		dumpToFileNamed: 'searchFASTANuccore2.fasta'.