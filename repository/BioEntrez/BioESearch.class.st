"
Search in PubMed for the term cancer for the entrez date from the last 60 days and retrieve the first 100 IDs and translations using the history parameter:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=cancer&reldate=60&datetype=edat&retmax=100&usehistory=y

Search in PubMed for the journal PNAS Volume 97, and retrieve 6 IDs starting at ID 7 using a tool parameter:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=PNAS[ta]+AND+97[vi]&retstart=6&retmax=6&tool=biomed3

Search in Journals for the term obstetrics:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=journals&term=obstetrics

Search in PubMed Central for stem cells in free fulltext articles:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pmc&term=stem+cells+AND+free+fulltext[filter]

Search in Nucleotide for a property of the sequence:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nucleotide&term=biomol+trna[prop]

Search in Protein for a molecular weight:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=protein&term=200020[molecular+weight]

http://www.ncbi.nlm.nih.gov/corehtml/query/static/esearch_help.html

"
Class {
	#name : #BioESearch,
	#superclass : #BioEWebEnvCmd,
	#category : 'BioEntrez-Commands'
}

{ #category : #'accessing private' }
BioESearch class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ 'esearch.fcgi'
]

{ #category : #testing }
BioESearch class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('retmode' 'db' 'rettype' 'term' 'field' 'usehistory' 'reldate' 'mindate' 'datetype' 'sort')
]
