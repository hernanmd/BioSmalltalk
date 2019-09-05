"
Split downloads records from GenBank if necessary


"
Class {
	#name : #BioNCBIGenBankDownloader,
	#superclass : #BioNamedObject,
	#instVars : [
		'dbName',
		'format',
		'uids',
		'results',
		'parsedResults',
		'reader'
	],
	#category : 'BioBlast-Remote'
}

{ #category : #'instance creation' }
BioNCBIGenBankDownloader class >> newFromReader: aBioReader [

	^ self new 
		reader: aBioReader; 
		yourself
]

{ #category : #testing }
BioNCBIGenBankDownloader >> checkValidContents [

	^ self processGenBankRecords notNil
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> dbName [
	^ dbName
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> dbName: aString [
	" Set the receiver's database name to be aString "

	dbName := aString
]

{ #category : #downloading }
BioNCBIGenBankDownloader >> download [
	" Private - Download records without splitting requests "
	
	self uids notEmpty
		ifTrue: [
			self bioLog: 'Requesting ' , self uids size asString , ' records to Entrez'.
			self results add: (self genBankFetchRecords: self uids) ]
		ifFalse: [
			self informMessage: 'No UIDs were found in the query' ].
	^ self results
]

{ #category : #private }
BioNCBIGenBankDownloader >> entrezUrlUidLimit [
	" Private - Answer a Number representing the maximum size of the UID list
	to be requested to the Entrez server "
	
	^ 500
]

{ #category : #testing }
BioNCBIGenBankDownloader >> exceedsLimit [

	^ self uids size >= self entrezUrlUidLimit 
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> format [
	^ format
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> format: aSymbol [
	" Set the receiver's download format to be aSaSymbol "

	format := aSymbol
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> genBankFetchRecords: aCollection [
	" Private - Fetch Entrez records from database named dbSymbol in format formatSymbol using UIDs from anArray. anArray is NOT splitted if exceeds #entrezUrlUidLimit "
	

	^ [ self prvGenBankFetchRecords: aCollection ]
	on: BioNotFoundObject 
	do: [ : ex | 
		| msg |
		msg := 'Database(s) not found in Entrez: ' , dbName asString, '. In doubt select nt/nr databases when doing a BLAST'.
		self bioLog: msg.
		self informMessage: msg.
		nil ].

]

{ #category : #accessing }
BioNCBIGenBankDownloader >> genBankSplitRecordsFrom: dbSymbol format: formatSymbol uids: anArray [
	" Private - Break the request into smaller chunks splittin anArray of UIDs.
	Answer a Collection of Collections to be joined "
	
	self 
		dbName: dbSymbol;
		format: formatSymbol;
		uids: anArray.
	^ self exceedsLimit
		ifTrue: [ self splitDownload ]
		ifFalse: [ self download ]
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> parsedResults [
	^ parsedResults
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> parsedResults: anObject [
	parsedResults := anObject
]

{ #category : #'accessing-entrez' }
BioNCBIGenBankDownloader >> processGenBankRecords [
	" Answer a <BioGBSeqCollection> if current results are valid, nil otherwise "

	[ self parsedResults: (self reader parseXMLDocumentsFromCollection: self results) parsedContents.
	self informMessage: 'Dowloaded GenBank records are valid' translated ]
	on: XMLWellFormednessException 
	do: [ : ex | self informMessage: 'XML is not well formed, if you downloaded data please try again'.
		^ nil ].
	^ self results
]

{ #category : #private }
BioNCBIGenBankDownloader >> prvGenBankFetchRecords: aCollection [ 

	| db entrezDbName |

	entrezDbName := (BioEntrezDatabase dbClassOf: self dbName) dbName. 
	db := BioEntrezClient new perform: entrezDbName asSymbol.	
	^ db
		perform: self format;	
		uids: aCollection ;
		fetch
	
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> reader [
	^ reader
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> reader: anObject [
	reader := anObject
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> results [

	^ results
		ifNil: [ results := OrderedCollection new: self uids size ]
]

{ #category : #downloading }
BioNCBIGenBankDownloader >> splitDownload [

	| index splittedRs |

	splittedRs := OrderedCollection new: self entrezUrlUidLimit.	
	index := 1.
	self uids do: [: id  |
			splittedRs add: id.
			index \\ self entrezUrlUidLimit = 0
				ifTrue: [
					self bioLog: 'Requesting ' , splittedRs size asString , ' records to Entrez'.
					self results add: (self genBankFetchRecords: splittedRs).
					splittedRs := OrderedCollection new: self entrezUrlUidLimit ].
			index := index + 1 ]
		displayingProgress: 'Downloading...' translated.
	" Add remaining records "
	self bioLog: 'Requesting ' , splittedRs size asString , ' records to Entrez'.
	self results add: (self genBankFetchRecords: splittedRs).
	^ self results
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> uids [
	^ uids
]

{ #category : #accessing }
BioNCBIGenBankDownloader >> uids: aCollection [
	" Set the receiver's UID's to be aCollection "

	uids := aCollection
]
