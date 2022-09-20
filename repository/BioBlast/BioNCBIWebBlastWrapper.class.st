"
Allows to perform a BLAST search using the QBLAST server at NCBI.

If you already have a XML file with results from a BLAST, see BioBLASTResultReader instead.

"
Class {
	#name : #BioNCBIWebBlastWrapper,
	#superclass : #BioNCBIBlastWrapper,
	#instVars : [
		'getUrl',
		'cmd'
	],
	#category : #'BioBlast-Remote'
}

{ #category : #accessing }
BioNCBIWebBlastWrapper class >> baseUrl [

	^ 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi'
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> aluRepeats [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIALURepeats new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> chromosome [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIChromosome new client: self)
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> database [

	^ self url dbName

]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> database: aGTNCBIDatabase [
	" Answer a GTCommandObject "

	self setPutCommand.
	cmd database: aGTNCBIDatabase dbName.
	^ cmd
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> dbsts [
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: ( BioNCBIDBSTS new client: self )
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> delete [
	" The 'Delete' command deletes request and results corresponding to specified RID from the QBlast "

	^ self execute: BioNCBIDelete
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> envNt [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIEnvNT new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> est [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIEST new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> estOthers [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIESTOthers new client: self)
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> fetch [
	"Answer a list of UIDs with the corresponding data records"

	^ self execute: BioNCBIFetch
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> get [
	"The 'Get' command gets formated results from QBlast"

	self setGetCommand.
	^ cmd
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> getUrl [
	"Answer the value of url for the get command"
	
	^ getUrl
		ifNil: [ getUrl := self urlClass fromString: self baseUrl ]	
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> getUrl: anObject [
	getUrl := anObject
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> gss [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIGSS new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> htgs [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIHTGS new client: self)
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> info [
	"The 'Info' provides up-to-date information about NCBI Blast."

	^ self execute: BioNCBIInfo
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> nucleotide [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
	
	^ self database: (BioNCBINucleotideCollection new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> pat [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIPat new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> pdb [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIPDB new client: self)
]

{ #category : #printing }
BioNCBIWebBlastWrapper >> printOn: aStream [
	"Private - See superimplementor´s comment"

	super printOn: aStream.
	aStream
		<< ' [';
		nextPutAll: getUrl asString;
		<< '] '
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> put [
	"The 'Put' command - Sends search requests to QBlast"

	self setPutCommand.
	^ cmd
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> putUrl [
	"Answer the value of url for the PUT command"
	
	^ self url
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> putUrl: anUrl [
	"Set the value of url for the PUT command"
	
	url := anUrl
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> rawGetUrl [
	"Answer the value of url for the get command"
	
	^ getUrl
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> refSeqGenomic [
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIRefSeqGenomic new client: self)
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> refSeqRNA [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIRefSeqRNA new client: self)
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> rid: aRequestIDString [
	" Request ID "
	
	self getUrl queryAt: 'RID' put: aRequestIDString
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> searchResultClass [

	^ BioWebBlastResult
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> setGetCommand [
	" Set the receiver's command to GET "

	cmd
		ifNil: [ cmd := BioNCBIGet new client: self ]
		ifNotNil: [ 	cmd isGet ifFalse: [ cmd := BioNCBIGet new client: self ] ].
	(self getUrl includesParameter: BioNCBICommand cmdString) 
		ifFalse: [ self getUrl startParameters: cmd baseUrl ]
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> setPutCommand [
	"Set the receiver's command to GET"

	cmd
		ifNil: [ cmd := BioNCBIPut new client: self ]
		ifNotNil: [ cmd isPut ifFalse: [ cmd := BioNCBIPut new client: self ] ].
	(self putUrl includesParameter: BioNCBICommand cmdString) ifFalse: [ 
		self putUrl: (self putUrl startParameters: cmd baseUrl) ]
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> url [
	"Answer the value of url"

	^ self rawUrl
		ifNil: [ url := self urlClass fromString: self baseUrl ]
]

{ #category : #'accessing private' }
BioNCBIWebBlastWrapper >> urlClass [
	" Answer a <Class> implementing an interpreted URL/URI "

	^ BioNCBIUrl2
]

{ #category : #'accessing public - commands' }
BioNCBIWebBlastWrapper >> web [
	"The 'Web' generates NCBI BLAST HTML pages. Parameters accepted: PAGE and all parameters corresponding to HTML elements."

	^ self execute: BioNCBIWeb
]

{ #category : #'accessing public - databases' }
BioNCBIWebBlastWrapper >> wgs [
	"Set the receiver's working database. Answer a <BioCommandObject> for specifying operations"
		
	^ self database: (BioNCBIWGS new client: self)
]
