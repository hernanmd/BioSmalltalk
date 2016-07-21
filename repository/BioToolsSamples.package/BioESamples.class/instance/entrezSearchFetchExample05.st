eUtilities-search-fetch
entrezSearchFetchExample05
	" 
	Download first 20 PubMedCentral OA (Open-Access) articles with CC-By-NC license (Attribution, noncommercial) in XML format
	"

	| searchResult fetchResult |
	searchResult := BioEntrezClient new pmc
		termCCByNCLicense;
		search.
	fetchResult := BioEntrezClient new pmc
		uids: searchResult idList;
		setModeXML;
		fetch.
	fetchResult dumpToFileNamed: 'pmc-nc.xml'
