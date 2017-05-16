eUtilities-search-fetch
entrezSearchFetchExample07
	" 
	Download bos taurus records from Gene database in XML format
	"

	| sr ec |
	sr := BioEntrezClient new gene
		term: 'bos+taurus[ORG]';
		search.
	ec := BioEntrezClient new gene
		uids: sr idList;
		setModeXML;
		fetch.
	ec dumpToFileNamed: 'e-gene-fetch-btau.xml'.
