"
The Entrez client is an interface to the well-known Entrez programming utilities provided by the NCBI. For documentation about the services please read http://www.ncbi.nlm.nih.gov/books/NBK25501/ which provides extensive details.

The basic pattern for using this client is the following:

BioEntrezClient new <dbNameSelector>	"" See accessing public - databases  ""
		<configuration messages>			
		<action>. 							"" See BioDBObject protocol actions ""
"
Class {
	#name : #BioEntrezClient,
	#superclass : #BioWebWrapper,
	#category : #'BioEntrez-Core'
}

{ #category : #'accessing-private' }
BioEntrezClient class >> baseUrl [
	" Private - Answer a <String> specifying a server valid addres for the receiver "

	^ 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils'
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> biosample [
	"Set and answer the receiver's working database"
		
	^ self database: (BioEntrezSample new client: self)

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> biosystems [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezBioSystems new client: self)

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> books [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezBooks new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> cancerchromosomes [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezCancerChromosomes new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> cdd [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezConservedDomains new client: self)

		

]

{ #category : #'accessing public' }
BioEntrezClient >> dbName: aString [
	" Set the receiver's database to the specified by aString "
	
	self url dbName: aString
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> domains [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezSDI new client: self)

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> fetch [
	" Answer a list of UIDs with the corresponding data records "

	^ self execute: BioEFetchCmd
]

{ #category : #'accessing private' }
BioEntrezClient >> fetchLiterature [
	" Private - Execute the command in the corresponding context "

	^ self execute: BioEFetchLit
]

{ #category : #'accessing private' }
BioEntrezClient >> fetchSequence [
	" Private - Execute the command in the corresponding context "

	^ self execute: BioEFetchSeq
]

{ #category : #'accessing private' }
BioEntrezClient >> fetchTaxonomy [
	" Private - Execute the command in the corresponding context "

	^ self execute: BioEFetchTax
]

{ #category : #'accessing public - commands' }
BioEntrezClient >> gQuery [
	" Answer the number of records matching the query in each Entrez database "

	^ self execute: BioEGlobalQuery
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> gap [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezDBGap new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> gds [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGDS new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> gene [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezGene new client: self)

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> genome [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezGenome new client: self)

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> genomeprj [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGenomeProject new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> gensat [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGenSat new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> geo [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGEO new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> homologene [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezHomoloGene new client: self )

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> info [
	" Answer the number of records indexed in each field of a diven database,
	the date of the last update of the database, and the available links
	from the database to other Entrez databases "

	^ self execute: BioEInfo
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> journals [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezJournals new client: self )

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> link [
	" Answer a list of related IDs in the same database or a list of
	linked IDs in another Entrez database given a list of UIDs "

	^ self execute: BioELink
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> mesh [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezMeSH new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> ncbisearch [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezWebSite new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> nlmcatalog [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezNLMCatalog new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> nuccore [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezNuccore new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> nucest [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezEST new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> nucgss [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGSS new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> omia [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezOMIA new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> omim [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezOMIM new client: self )

		

]

{ #category : #accessing }
BioEntrezClient >> parameters [
	"Answer a <Collection> with the receiver's configured parameters"
	
	^ self url parameters
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> pcassay [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPCAssay new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> pccompound [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPCCompound new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> pcsubstance [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPCSubstance new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> peptidome [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPeptidome new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> pmc [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezPubMedCentral new client: self)

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> popset [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPopSet new client: self )

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> post [
	" Stores the given list of UIDs in the History Server, and answer
	with the corresponding query key and web environment "

	^ self execute: BioEPost
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> probe [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezProbe new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> protein [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezProtein new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> proteinclusters [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezProteinClusters new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> pubmed [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezPubMed new client: self)

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> search [
	" Answer a <BioESearchResult> with the list of UIDs matching the query in a diven database, along with the term translation of the query "

	^ self execute: BioESearch
]

{ #category : #'accessing private' }
BioEntrezClient >> searchResultClass [

	^ BioESearchResult
]

{ #category : #'accessing private' }
BioEntrezClient >> setEmail [
	"Answer a String for identifying this application"
	
	^ self url emailAddress: 'biosmalltalk@gmail.com'.
]

{ #category : #'accessing private' }
BioEntrezClient >> setTool [
	" Answer a String for identifying this application "
	
	^ self url toolName: 'BioSmalltalk'.
]

{ #category : #'accessing public' }
BioEntrezClient >> setUseHistory [
	" Store the retrieved sets of UIDs temporarily in the Entrez history server
	so that they can be subsequently combined or provided as input for
	other calls. Set the receiver's to use the remove web environment and
	query key "
	
	^ self url setUseHistory
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> snp [
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezSNP new client: self)

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> spell [
	" Answer a Collection with spelling suggestions for a query in the selected Entrez database "

	^ self execute: BioESpell
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> sra [
	"Set and answer the receiver's working database"
		
	^ self database: (BioEntrezSRA new client: self)

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> structure [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezStructure new client: self )

		

]

{ #category : #'accessing public - commands' }
BioEntrezClient >> summary [
	" Answer document summaries given a list of UIDs "

	^ self execute: BioESummary
]

{ #category : #'accessing public - commands' }
BioEntrezClient >> summaryAlternative [
	" Answer document summaries given a list of UIDs "

	^ self execute: BioESummaryAlternative
]

{ #category : #'accessing public - databases' }
BioEntrezClient >> taxonomy [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezTaxonomy new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> unigene [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezUniGene new client: self )

		

]

{ #category : #'accessing public - databases' }
BioEntrezClient >> unists [
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezUniSTS new client: self )

		

]

{ #category : #'accessing private' }
BioEntrezClient >> url [
	"Answer the value of url"

	^ self rawUrl
		ifNil: [ url := self urlClass fromString: self baseUrl ]
]

{ #category : #'accessing private' }
BioEntrezClient >> urlClass [
	" Answer a <Class> implementing an interpreted URL/URI "

	^ BioEntrezUrl
]

{ #category : #'accessing public' }
BioEntrezClient >> useWebEnv [
	" Search with the current parameters and answer 
	a new instance of the receiver's using previous web environment  "
	
	| webEnv newInstance |
	
	webEnv := self setUseHistory; search.
	newInstance := self class new.
	(newInstance perform: self url dbName asSymbol) client: newInstance.
	[ newInstance webEnv: webEnv ]
	on: BioErrorSpecificationObject
	do: [ : ex | ^ self lastStatus: ex messageText ].
	^ self becomeForward: newInstance

]

{ #category : #'accessing public' }
BioEntrezClient >> webEnv: aBioESearchResult [
	" Set the receiver's web environment and query key from aGETSearchResult "
	
	^ self url
		queryKey: aBioESearchResult queryKey first;
		webEnv: aBioESearchResult webEnv first
]
