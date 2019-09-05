Class {
	#name : #BioEntrezClientTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'entrezClient'
	],
	#category : 'BioEntrezTests-Core'
}

{ #category : #accessing }
BioEntrezClientTest >> entrezClient [
	"Answer the value of entrezClient"

	^ entrezClient
]

{ #category : #accessing }
BioEntrezClientTest >> entrezClient: anObject [
	"Set the value of entrezClient"

	entrezClient := anObject
]

{ #category : #accessing }
BioEntrezClientTest >> setUp [

	super setUp.
	entrezClient := BioEntrezClient new.
]

{ #category : #testing }
BioEntrezClientTest >> testCreation [

	self assert: (self entrezClient isKindOf: BioEntrezClient).


]

{ #category : #testing }
BioEntrezClientTest >> testDatabaseSetting [

	self assert: ( self entrezClient biosystems isKindOf: BioEntrezBioSystems ).
	self assert: ( self entrezClient books isKindOf: BioEntrezBooks ).
	self assert: ( self entrezClient cancerchromosomes isKindOf: BioEntrezCancerChromosomes ).
	self assert: ( self entrezClient cdd isKindOf: BioEntrezConservedDomains ).
	self assert: ( self entrezClient domains isKindOf: BioEntrezSDI ).
	self assert: ( self entrezClient gap isKindOf: BioEntrezDBGap ).
	self assert: ( self entrezClient gds isKindOf: BioEntrezGDS ).
	self assert: ( self entrezClient gene isKindOf: BioEntrezGene ).
	self assert: ( self entrezClient genome isKindOf: BioEntrezGenome ).
	self assert: ( self entrezClient genomeprj isKindOf: BioEntrezGenomeProject ).
	self assert: ( self entrezClient gensat isKindOf: BioEntrezGenSat ).
	self assert: ( self entrezClient geo isKindOf: BioEntrezGEO ).
	self assert: ( self entrezClient homologene isKindOf: BioEntrezHomoloGene ).
	self assert: ( self entrezClient journals isKindOf: BioEntrezJournals ).
	self assert: ( self entrezClient mesh isKindOf: BioEntrezMeSH ).
	self assert: ( self entrezClient ncbisearch isKindOf: BioEntrezWebSite ).
	self assert: ( self entrezClient nlmcatalog isKindOf: BioEntrezNLMCatalog ).
	self assert: ( self entrezClient nuccore isKindOf: BioEntrezNuccore ).
	self assert: ( self entrezClient nucest isKindOf: BioEntrezEST ).
	self assert: ( self entrezClient nucgss isKindOf: BioEntrezGSS ).
	self assert: ( self entrezClient omia isKindOf: BioEntrezOMIA ).
	self assert: ( self entrezClient omim isKindOf: BioEntrezOMIM ).
	self assert: ( self entrezClient pcassay isKindOf: BioEntrezPCAssay ).
	self assert: ( self entrezClient pccompound isKindOf: BioEntrezPCCompound ).
	self assert: ( self entrezClient pcsubstance isKindOf: BioEntrezPCSubstance ).
	self assert: ( self entrezClient peptidome isKindOf: BioEntrezPeptidome ).
	self assert: ( self entrezClient pmc isKindOf: BioEntrezPubMedCentral ).
	self assert: ( self entrezClient popset isKindOf: BioEntrezPopSet ).
	self assert: ( self entrezClient probe isKindOf: BioEntrezProbe ).
	self assert: ( self entrezClient protein isKindOf: BioEntrezProtein ).
	self assert: ( self entrezClient proteinclusters isKindOf: BioEntrezProteinClusters ).
	self assert: ( self entrezClient pubmed isKindOf: BioEntrezPubMed ).
	self assert: ( self entrezClient snp isKindOf: BioEntrezSNP ).
	self assert: ( self entrezClient sra isKindOf: BioEntrezSRA ).
	self assert: ( self entrezClient structure isKindOf: BioEntrezStructure ).
	self assert: ( self entrezClient taxonomy isKindOf: BioEntrezTaxonomy ).
	self assert: ( self entrezClient unigene isKindOf: BioEntrezUniGene ).
	self assert: ( self entrezClient unists isKindOf: BioEntrezUniSTS ).
]

{ #category : #testing }
BioEntrezClientTest >> testDbClassOf [
	self
		assert: (BioEntrezDatabase dbClassOf: 'nuccore')
		equals: BioEntrezNuccore.
	self
		assert: (BioEntrezDatabase dbClassOf: 'biosample')
		equals: BioEntrezSample
]

{ #category : #testing }
BioEntrezClientTest >> testDescription [

	self entrezClient: BioEntrezClient new nuccore.

	self assert: ( self entrezClient class description isKindOf: String ).
	self deny: self entrezClient class description isEmpty.

]

{ #category : #testing }
BioEntrezClientTest >> testDisplayDefault [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayDefault.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '0'
]

{ #category : #testing }
BioEntrezClientTest >> testDisplayMinimalBioseq [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayMinimalBioseq.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '2'
]

{ #category : #testing }
BioEntrezClientTest >> testDisplayMinimalNucProt [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayMinimalNucProt.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '3'
]

{ #category : #testing }
BioEntrezClientTest >> testDisplayMinimalPubSet [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayMinimalPubSet.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '4'
]

{ #category : #testing }
BioEntrezClientTest >> testDisplayWholeBlob [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayWholeBlob.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '0'
]

{ #category : #testing }
BioEntrezClientTest >> testFields [

	self entrezClient: BioEntrezClient new pubmed.

	self assert: ( self entrezClient fields isKindOf: Collection ).
	self deny: self entrezClient fields isEmpty.

]

{ #category : #testing }
BioEntrezClientTest >> testRettypeFields [

	self entrezClient: BioEntrezClient new pubmed.

	self assert: ( self entrezClient rettypeFields isKindOf: Collection ).
	self deny: self entrezClient rettypeFields isEmpty.

]

{ #category : #testing }
BioEntrezClientTest >> testSeqStart [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient seqStart: 1.
	self
		assert: (self entrezClient valueForParameter: 'seq_start')
		equals: '1'
]

{ #category : #testing }
BioEntrezClientTest >> testSeqStop [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient seqStop: 1.
	self
		assert: (self entrezClient valueForParameter: 'seq_stop')
		equals: '1'
]

{ #category : #testing }
BioEntrezClientTest >> testSetASN1 [
	| db |
	db := self entrezClient nuccore uids: #(12800).
	self deny: (db url includesParameter: 'retmode').
	db setModeASN1.
	self assert: (db url valueForParameter: 'retmode') equals: 'asn.1'
]

{ #category : #testing }
BioEntrezClientTest >> testSetEst [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient setEst.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'est'
]

{ #category : #testing }
BioEntrezClientTest >> testSetFasta [
	self entrezClient: BioEntrezClient new nuccore.
	self entrezClient setFasta.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'fasta'
]

{ #category : #testing }
BioEntrezClientTest >> testSetGb [
	self entrezClient: BioEntrezClient new nuccore.
	self entrezClient setGb.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'gb'
]

{ #category : #testing }
BioEntrezClientTest >> testSetGp [
	self entrezClient: BioEntrezClient new protein.
	self entrezClient setGp.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'gp'.
	self entrezClient setGpc.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'gpc'
]

{ #category : #testing }
BioEntrezClientTest >> testSetGss [
	self entrezClient: BioEntrezClient new nucgss.
	self entrezClient setGss.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'gss'
]

{ #category : #testing }
BioEntrezClientTest >> testSetHTML [

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: (db url includesParameter: 'retmode').
	db setModeHTML.	
	self assert: (db url valueForParameter: 'retmode') equals: 'html'.
]

{ #category : #testing }
BioEntrezClientTest >> testSetTerm [
	self entrezClient: BioEntrezClient new nuccore.
	self entrezClient term: 'Opuntia AND rpl16'.
	self
		assert: (self entrezClient valueForParameter: 'term')
		equals: 'Opuntia AND rpl16'
]

{ #category : #testing }
BioEntrezClientTest >> testSetText [

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: (db url includesParameter: 'retmode').
	db setModeText.	
	self assert: (db url valueForParameter: 'retmode') equals: 'text'.	
]

{ #category : #testing }
BioEntrezClientTest >> testSetXML [

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: (db url includesParameter: 'retmode').
	db setModeXML.
	self assert: (db url valueForParameter: 'retmode') equals: 'xml'.
]

{ #category : #testing }
BioEntrezClientTest >> testStrandMinus [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient strandMinus.
	self
		assert: (self entrezClient valueForParameter: 'strand')
		equals: '2'
]

{ #category : #testing }
BioEntrezClientTest >> testStrandPlus [
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient strandPlus.
	self
		assert: (self entrezClient valueForParameter: 'strand')
		equals: '1'
]

{ #category : #testing }
BioEntrezClientTest >> testUrlAccess [

	| db |
	db := self entrezClient nuccore.
	self assert: (db url isKindOf: BioEntrezUrl).
	self assert: (db downloadUrl isKindOf: String).
	self assert: db url scheme equals: 'https'.
	self assert: db url authority equals: 'eutils.ncbi.nlm.nih.gov'.
	self assert: (db url webClient isKindOf: BioWebClientEngine).

]

{ #category : #testing }
BioEntrezClientTest >> testValidParameters [

	self assert: ( BioEFetchCmd validParameters isKindOf: Collection ).
	self assert: ( BioEFetchRetCmd validParameters isKindOf: Collection ).
	self assert: ( BioEFetchSeq validParameters isKindOf: Collection ).
	self assert: ( BioEFetchTax validParameters isKindOf: Collection ).
	self assert: ( BioEGlobalQuery validParameters isKindOf: Collection ).
	self assert: ( BioEInfo validParameters isKindOf: Collection ).
	self assert: ( BioELink validParameters isKindOf: Collection ).
	self assert: ( BioEPost validParameters isKindOf: Collection ).
	self assert: ( BioESearch validParameters isKindOf: Collection ).
	self assert: ( BioESpell validParameters isKindOf: Collection ).
	self assert: ( BioESummary validParameters isKindOf: Collection ).
	self assert: ( BioEWebEnvCmd validParameters isKindOf: Collection ).
	self assert: ( BioEntrezCommand validParameters isKindOf: Collection ).

]
