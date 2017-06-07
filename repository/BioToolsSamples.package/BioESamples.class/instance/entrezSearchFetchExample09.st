eUtilities-search-fetch
entrezSearchFetchExample09
	" 
	Download and save into a XML file the gene sequences for Bos taurus
	"

	(BioEntrezClient new gene
		uids: (BioEntrezClient new gene
			queryBosTaurus;
			search) idList;
		setModeXML;
		fetch) dumpToFileNamed: 'e-gene-btau.xml'.