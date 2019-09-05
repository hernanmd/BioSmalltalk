"
Sample scripts for using the Entrez system API

"
Class {
	#name : #BioESamples,
	#superclass : #BioSamples,
	#category : 'BioToolsSamples-Core'
}

{ #category : #'eUtilities-fetch' }
BioESamples >> entrezFetchSample01 [
	" self new entrezFetchSample01 "

	| result |
	
	result := BioEntrezClient new nuccore
				uids: #(12800);
				setModeText;
				fetch.
	result dumpToFileNamed: 'searchNuccore1.txt'


]

{ #category : #'eUtilities-fetch' }
BioESamples >> entrezFetchSample02 [
	" Outputs a GenBank file for a list of GenBank identifiers "
	
	| result |
	
	result := BioEntrezClient new nuccore
				uids: #(57240072 57240071 6273287 6273291 6273290 6273289 6273286 6273285 6273284);
				setGb;
				fetch.
	result dumpToFileNamed: 'fetchNuccore3.gb'


]

{ #category : #'eUtilities-fetch' }
BioESamples >> entrezFetchSample03 [
	" Outputs an XML with information "
	
	| result |
	
	result := 
		BioEntrezClient new pubmed 
			uids: #( 11877539 11822933 );
			setModeXML;
			fetch.
	result dumpToFileNamed: 'eFetch1.xml'


]

{ #category : #'eUtilities-fetch' }
BioESamples >> entrezFetchSample04 [
	" Outputs a Fasta file for a list of accession numbers "
	
	| result |
	
	result := BioEntrezClient new nuccore
				uids: #('AB177765.1' 'AB177791.1');
				setFasta;
				fetch.
	result dumpToFileNamed: 'nuccore_seqs.fasta'


]

{ #category : #'eUtilities-info' }
BioESamples >> entrezInfoSample01 [
	" Outputs an XML with information about PubMed database "
	
	| result |
	
	result := BioEntrezClient new pubmed info.
	result dumpToFileNamed: 'eInfo1.xml'


]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample01 [
	" 
	1) Using a client to search a gene and get a Collection of Gene Identifiers from the Nuccore database
	2) Use the obtained gene id's to fetch the results from the Nuccore database
	Use the remote web environment and query key 
	"

	| searchResult1 searchResult2 |

	searchResult1 := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			setUseHistory;
			search.

	searchResult2 := BioEntrezClient new nuccore
		webEnv: searchResult1;
		setFasta;
		fetch.

	searchResult2 
		dumpToFileNamed: 'searchFASTANuccore3.fasta'.
]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample02 [
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
		dumpToFileNamed: 'searchFASTANuccore4.fasta'.
]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample03 [
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
]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample04 [
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
		dumpToFileNamed: 'searchFASTANuccore7.fasta'.
		
	searchResult2 := 
		searchResult1 client nuccore
			setGb;
			fetch.
			
	searchResult2 
		dumpToFileNamed: 'searchGbNuccore7.gb'.

]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample05 [
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

]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample06 [
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

]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample07 [
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

]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample08 [
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
]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> entrezSearchFetchExample09 [
	" 
	Download and save into a XML file the gene sequences for Bos taurus
	"

	(BioEntrezClient new gene
		uids: (BioEntrezClient new gene
			queryBosTaurus;
			search) idList;
		setModeXML;
		fetch) dumpToFileNamed: 'e-gene-btau.xml'.
]

{ #category : #'eUtilities-search' }
BioESamples >> entrezSearchSample01 [
	" self new entrezClientSample02 "

	| result |
	
	result := BioEntrezClient new nuccore
				term: 'Opuntia AND rpl16';
				search.
	result dumpToFileNamed: 'searchNuccore1.xml'

]

{ #category : #'eUtilities-search' }
BioESamples >> entrezSearchSample02 [
	" Using a client to get a Collection of Gene Identifiers 
	from an Entrez search result (not provided = search is performed).
	Does NOT use the remote web environment and query key "

	| searchResult |

	searchResult := 
		BioEntrezClient new nuccore
			term: 'AF288373.2';
			search.
	^ searchResult idList.
]

{ #category : #'eUtilities-search' }
BioESamples >> entrezSearchSample03 [
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
]

{ #category : #'eUtilities-spelling' }
BioESamples >> entrezSpellingSample01 [
	" Outputs an XML with spelling suggestions for the query term String "
	
	| result |
	
	result := 
		BioEntrezClient new pmc 
			term: 'fiberblast cell grwth';
			spell.
	result dumpToFileNamed: 'eSpell1.xml'


]

{ #category : #'eUtilities-summary' }
BioESamples >> entrezSummarySample01 [
	" Outputs an XML with information about summaries "
	
	| result |
	
	result := 
		BioEntrezClient new protein 
			uids: #( 6678417 9507199 );
			summary.
	result dumpToFileNamed: 'eSummary1.xml'


]

{ #category : #'eUtilities-summary' }
BioESamples >> entrezSummarySample02 [
	" Outputs an XML with information about summaries "
	
	| result |
	
	result := 
		BioEntrezClient new protein 
			uids: #( 6678417 9507199 );
			summaryAlternative.
	result dumpToFileNamed: 'eSummary_alternative.xml'


]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> exampleDLoopPig [
	" 
	Download and save into a FASTA file the d-loop sequence for Sus scrofa. From: Complete nucleotide sequence of pig (Sus scrofa) mitochondrial genome and dating evolutionary divergence within Artiodactyla. Chich-Sheng et al. Gene 236 (1999) 107–114
	"

	| fastaRecord |
	fastaRecord := (BioEntrezClient new nuccore
		webEnv: (BioEntrezClient new nuccore
			term: 'AF034253';
			setUseHistory;
			search);
		setFasta;
		fetch) contents asFastaRecord.
	(fastaRecord sequence copyFrom: 1 to: 1175) dumpToFileNamed: 'e-nuccore-sus_scrofa-dloop.fa'.
]

{ #category : #'eUtilities-search-fetch' }
BioESamples >> exampleDLoopSheep [
	" 
	Download and save into a FASTA file the d-loop sequence for Sheep
	"
	| fastaRecord |
	fastaRecord := (BioEntrezClient new nuccore
		webEnv: (BioEntrezClient new nuccore
			term: 'L29055';
			setUseHistory;
			search);
		setFasta;			
		fetch) contents asFastaRecord.
	(fastaRecord sequence copyFrom: 670 to: 1858) dumpToFileNamed: 'e-nuccore-sheep-dloop.fa'.

]
