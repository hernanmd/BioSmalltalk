"
http://www.ncbi.nlm.nih.gov/blast/Doc/node6.html

Example: 

http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Get&RID=954517013-7639-11119

"
Class {
	#name : #BioNCBIGet,
	#superclass : #BioNCBICSCommand,
	#category : 'BioNCBI-Commands'
}

{ #category : #accessing }
BioNCBIGet >> alignmentViewFlatQueryAnchored [
	" Type of alignment view (FORMAT_OBJECT=Alignment only).
	This is the option described in web page as 
	Flat query-anchored with dots for identities "
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'FlatQueryAnchored'
]

{ #category : #accessing }
BioNCBIGet >> alignmentViewFlatQueryAnchoredNoIdentities [
	" Type of alignment view (FORMAT_OBJECT=Alignment only)
	This is the option described in web page as 
	Flat query-anchored with letters for identities "
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'FlatQueryAnchoredNoIdentities'
]

{ #category : #accessing }
BioNCBIGet >> alignmentViewPairwise [
	" Type of alignment view (FORMAT_OBJECT=Alignment only) "
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'Pairwise'
]

{ #category : #accessing }
BioNCBIGet >> alignmentViewQueryAnchored [
	" Type of alignment view (FORMAT_OBJECT=Alignment only)
	This is the option described in web page as 
	Query-anchored with dots for identities
	 "
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'QueryAnchored'
]

{ #category : #accessing }
BioNCBIGet >> alignmentViewQueryAnchoredNoIdentities [
	" Type of alignment view (FORMAT_OBJECT=Alignment only) 
	This is the option described in web page as 
	Query-anchored with letters for identities
	"
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'QueryAnchoredNoIdentities'
]

{ #category : #accessing }
BioNCBIGet >> alignmentViewTabular [
	" Type of alignment view (FORMAT_OBJECT=Alignment only) "
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'Tabular'
]

{ #category : #accessing }
BioNCBIGet >> alignments: aSmallInteger [
	" Number of alignments "
	
	self clientUrl queryAt: 'ALIGNMENTS' put: aSmallInteger asString
]

{ #category : #'accessing private' }
BioNCBIGet >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Get'
]

{ #category : #testing }
BioNCBIGet >> checkParameters [
	" Answer <true> if the receiver supports client parameters "
	
	^ self client rawUrl isNil not and: [ self client url asText isEmpty not ]
]

{ #category : #'accessing private' }
BioNCBIGet >> clientUrl [
	" Answer a GTNCBIUrl object "
	
	^ self client getUrl
]

{ #category : #accessing }
BioNCBIGet >> descriptions: aSmallIntegerString [
	" Number of descriptions "
	
	self clientUrl addParameters: 'DESCRIPTIONS=' , aSmallIntegerString
]

{ #category : #'accessing private' }
BioNCBIGet >> doesNotUnderstand: aMessage [
	" Private - Redirect messages not understood to the PUT command.
	This allows to have interchangeable message sends to the NCBI Client
	without having to specify put or get start/end modes "
	
	^ aMessage sentTo: self put
]

{ #category : #accessing }
BioNCBIGet >> entrezLinksNewWindowOff [
	" Add TARGET to Entrez links in formatted results "
	
	self clientUrl queryAt: 'ENTREZ_LINKS_NEW_WINDOW' put: 'no'
]

{ #category : #accessing }
BioNCBIGet >> entrezLinksNewWindowOn [
	" Add TARGET to Entrez links in formatted results "
	
	self clientUrl queryAt: 'ENTREZ_LINKS_NEW_WINDOW' put: 'yes'
]

{ #category : #accessing }
BioNCBIGet >> expectHigh: aFloat [
	" High expect value threshold for formatting "
	
	self clientUrl queryAt: 'EXPECT_HIGH' put: aFloat asString
]

{ #category : #accessing }
BioNCBIGet >> expectLow: aFloat [
	" Low expect value threshold for formatting "
	
	self clientUrl queryAt: 'EXPECT_LOW' put: aFloat asString
]

{ #category : #accessing }
BioNCBIGet >> formatEntrezQuery: aString [
	" Entrez query to limit formatting of Blast results "
	
	self clientUrl queryAt: 'FORMAT_ENTREZ_QUERY' put: aString
]

{ #category : #accessing }
BioNCBIGet >> formatObjectAlignment [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'Alignment'
]

{ #category : #accessing }
BioNCBIGet >> formatObjectNeighbors [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'Neighbors'
]

{ #category : #accessing }
BioNCBIGet >> formatObjectPSSM [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'PSSM'
]

{ #category : #accessing }
BioNCBIGet >> formatObjectSearchInfo [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'SearchInfo'
]

{ #category : #accessing }
BioNCBIGet >> formatObjectTaxBlast [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'TaxBlast'
]

{ #category : #accessing }
BioNCBIGet >> formatObjectTaxBlastMultiFrame [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'TaxBlastMultiFrame'
]

{ #category : #accessing }
BioNCBIGet >> formatObjectTaxblastParent [
	" Specifies object to get "
	
	self clientUrl queryAt: 'FORMAT_OBJECT' put: 'TaxblastParent'
]

{ #category : #accessing }
BioNCBIGet >> formatTypeAsn1 [
	" Type of formatting "
	
	self clientUrl queryAt: 'FORMAT_TYPE' put: 'ASN.1'
]

{ #category : #accessing }
BioNCBIGet >> formatTypeHTML [
	" Type of formatting "
	
	self clientUrl queryAt: 'FORMAT_TYPE' put: 'HTML'
]

{ #category : #accessing }
BioNCBIGet >> formatTypeText [
	" Type of formatting "
	
	self clientUrl queryAt: 'FORMAT_TYPE' put: 'Text'
]

{ #category : #accessing }
BioNCBIGet >> formatTypeXML [
	" Type of formatting "
	
	self clientUrl queryAt: 'FORMAT_TYPE' put: 'XML'
]

{ #category : #testing }
BioNCBIGet >> isGet [
	
	^ true
]

{ #category : #accessing }
BioNCBIGet >> resultsFileOff [
	" Allow to download megablast results as a gzip-compressed file "
	
	self clientUrl queryAt: 'RESULTS_FILE' put: 'no'
]

{ #category : #accessing }
BioNCBIGet >> resultsFileOn [
	" Allow to download megablast results as a gzip-compressed file "
	
	self clientUrl queryAt: 'RESULTS_FILE' put: 'yes'
]

{ #category : #accessing }
BioNCBIGet >> showNCBIGiOff [
	" Show NCBI GI "
	
	self clientUrl queryAt: 'NCBI_GI' put: 'no'
]

{ #category : #accessing }
BioNCBIGet >> showNCBIGiOn [
	" Show NCBI GI "
	
	self clientUrl queryAt: 'NCBI_GI' put: 'yes'
]

{ #category : #accessing }
BioNCBIGet >> showOverviewOff [
	" Show graphical overview "
	
	self clientUrl queryAt: 'SHOW_OVERVIEW' put: 'no'
]

{ #category : #accessing }
BioNCBIGet >> showOverviewOn [
	" Show graphical overview "
	
	self clientUrl queryAt: 'SHOW_OVERVIEW' put: 'yes'
]
