eUtilities-search-fetch
entrezSearchFetchExample06
	" 
	Download first 20 PubMedCentral OA (Open-Access) articles with CC BY-NC-ND license (Attribution, noncommercial, no derivatives) in TEXT format
	"

	| searchResult fetchResult |
	searchResult := BioEntrezClient new pmc
		termCCByNCNDLicense;
		search.
	fetchResult := BioEntrezClient new pmc
		uids: searchResult idList;
		setModeText;
		fetch.
	fetchResult dumpToFileNamed: 'pmc-nc-nd.txt'
