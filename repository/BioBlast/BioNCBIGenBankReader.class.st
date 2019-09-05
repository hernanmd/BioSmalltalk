"
This class provides methods for reading a GenBank file as defined by http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd

Subclasses may implement different modes of reading, such as supporting UI or batch downloading.

"
Class {
	#name : #BioNCBIGenBankReader,
	#superclass : #BioNCBIReader,
	#instVars : [
		'genBankDownloader'
	],
	#category : 'BioBlast-Remote'
}

{ #category : #'instance creation' }
BioNCBIGenBankReader class >> filesFromFlatDirectory: aDirectoryString [
	" Answer a <Collection> of readers iterating over the files located at aDirectoryString "

	^ (self filesIn: aDirectoryString) asFileCollection
			select: [ : file | file isGenBankFlatFormat ]
			thenCollect: [ : file | self parseFlatDocumentFrom: file ]
]

{ #category : #private }
BioNCBIGenBankReader class >> isPreferredFor: aString [
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString beginsWith: 'LOCUS       '
]

{ #category : #'instance creation' }
BioNCBIGenBankReader class >> newFromCSVFile: csvFilename [
	" Answer a new instance of the receiver with contents from csvFilename "
	
	^ self new parseCSVFileFrom: csvFilename
]

{ #category : #accessing }
BioNCBIGenBankReader >> checkValidContents [
	" Answer <true> if contents were correctly downloaded "
	
	^ self genBankDownloader checkValidContents
]

{ #category : #'accessing-entrez' }
BioNCBIGenBankReader >> genBankDownloader [

	^ genBankDownloader
		ifNil: [ genBankDownloader := BioNCBIGenBankDownloader newFromReader: self ]

]

{ #category : #'accessing-entrez' }
BioNCBIGenBankReader >> genBankRecordsAsXMLFrom: aBioBlastParentNodeCollection database: databaseName [
	" With aBioBlastParentNodeCollection of BLASTHitNode's, query the Entrez system at databaseName and answer a <String> with XML contents "
	
	contents := self
			genBankRecordsFrom: databaseName
			format: #setModeXML
			uids: (self giListFrom: aBioBlastParentNodeCollection)

]

{ #category : #'accessing-entrez' }
BioNCBIGenBankReader >> genBankRecordsFrom: dbSymbol format: formatSymbol uids: anArray [
	" Fetch Entrez records from database named dbSymbol in format formatSymbol
	using UIDs from anArray. anArray is splitted if exceeds #entrezUrlUidLimit "

	^ self genBankDownloader
		genBankSplitRecordsFrom: dbSymbol 
		format: formatSymbol 
		uids: anArray


]

{ #category : #'accessing-entrez' }
BioNCBIGenBankReader >> giListFrom: anObject [
	" Answer a Collection with the gene identifiers numbers from anObject "

	^ anObject contents 
		collect: [: id | BioParser tokenizeGi: id hitIdentifier blastValue ]
]

{ #category : #testing }
BioNCBIGenBankReader >> isGenBankXMLDirectory: aString [ 
	" Answer <true> if all files contained in aString are XML files with GenBank DTD "
	
	^ aString asFileReference entries allSatisfy: #isGenBankXML
]

{ #category : #accessing }
BioNCBIGenBankReader >> parseCSVFileFrom: aFilename [
	" Parse documents located at aFilename in the internal CSV format, and update the receiver's contents with the result "
	
	| csvReader dictionary header answer |
	csvReader := (NeoCSVReader on: (self openFullFileNamed: aFilename) readStream)
		separator: $|;
		yourself.
	answer := OrderedCollection new: 3000.
	header := csvReader readHeader reject: #isNil.
	csvReader rowsDo:  [ : row | 
		| rowValues |
		(rowValues := row reject: #isNil) size = header size ifTrue: [ 
			dictionary := Dictionary new.
			rowValues doWithIndex: [ : val : index | dictionary at: (header at: index) put: val; yourself ].
			answer add: dictionary ] ].
	^ answer.

]

{ #category : #accessing }
BioNCBIGenBankReader >> parseFlatDocumentFrom: aDataSource [
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self shouldBeImplemented 
]

{ #category : #accessing }
BioNCBIGenBankReader >> parseFlatDocumentsFrom: aDataSource [
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ((BioGBSeqCollection filesFromFlatDirectory: aDataSource) 
			parser: self classifier parserClass;
			parseDocuments)
]

{ #category : #accessing }
BioNCBIGenBankReader >> parseXMLDocumentsFromCollection: aCollection [
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ((BioGBSeqCollection newFromXMLCollection: aCollection) 
			parser: self parser;
			parseDocuments)
]

{ #category : #accessing }
BioNCBIGenBankReader >> parseXMLDocumentsFromDirectory: aDataSource [
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	[ self validateXMLDataSource: aDataSource ]
	on: BioErrorSpecificationObject 
	do: [ : ex | ^ self contents: BioGBSeqCollection new ].
	self contents: ((BioGBSeqCollection filesFromXMLDirectory: aDataSource) 
			parser: self parser;
			parseDocuments)
]

{ #category : #accessing }
BioNCBIGenBankReader >> parsedContents [
	" Answer the parsed object resulting from the receiver's contents using the receiver's parser "

	^ self results contents isBioCollection
		ifFalse: [ BioParser tokenizeNcbiXmlEntrezSearchResult: self results contents ]
		ifTrue: [ self results contents ]
]

{ #category : #accessing }
BioNCBIGenBankReader >> parsedFilesCount [
	" Answer how many files were parsed for retrieving downloaded contents "
	
	^ results size
]

{ #category : #'accessing-filters' }
BioNCBIGenBankReader >> resultClass [

	^ BioNCBIGenBankResult
]

{ #category : #accessing }
BioNCBIGenBankReader >> resultSizeInMb [
	" Answer the size of the result set in megabytes "

	| answer |
	(answer := (contents sum: #size) / 1048576) asInteger = 0
		ifTrue: [ answer asFloat roundTo: 0.01 ].
	^ answer
]

{ #category : #accessing }
BioNCBIGenBankReader >> saveFilterContents [
	" Private - Save receiver's contents if appropriate "

	self subclassResponsibility
]

{ #category : #'accessing-entrez' }
BioNCBIGenBankReader >> selectGenBankRecords: aBlock [
	" Select GenBank records from XML contents retrieved on-line and answer a <Collection> "
	
	contents := self genBankRecordsAsXML parseDocuments.
	^ (contents select: aBlock) asBio: self nodesCollectionClass
]

{ #category : #'accessing-entrez' }
BioNCBIGenBankReader >> selectGenBankRecords: selectBlock from: aDataSource [
	" Off-Line version "
	
	| tmpResults |
	
	tmpResults := OrderedCollection new.
	contents
		ifNil: [ contents := (BioGBSeqCollection filesFromXMLDirectory: aDataSource) parseDocuments ].
	contents do: [: seqRecord | 
		(selectBlock value: seqRecord)
			ifTrue: [ tmpResults add: seqRecord ] ].
	^ tmpResults asBio: BioGBSeqCollection
]

{ #category : #testing }
BioNCBIGenBankReader >> validateXMLDataSource: aString [ 
	" Raise an exception if aString path is not valid for the receiver "

	Cursor read showWhile: [ 
		(self isGenBankXMLDirectory: aString)
			ifFalse: [ BioObject signalInvalidObject: 'Not all files in ' , aString asString , ' are XML or some of them are not recognized as XML format, please try again' ]
			ifTrue: [ self searchResults: (aString asFileReference entries collect: #asFileReference)  asOrderedCollection ] ]
]
