eUtilities-search
entrezSearchSample03
	" 
	Using a client to search a gene and get a Collection of Gene Identifiers from the Nuccore database
	in the Entrez history server.
	Use the remote web environment and query key 
	"

	| searchResult1 |

	searchResult1 := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			setUseHistory;
			search.
	searchResult1 
		dumpToFileNamed: 'searchUsingHistory.xml'.