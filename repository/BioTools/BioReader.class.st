"
BioReader is an abstract class representing the base for all essential iteration operations using a specific parser. Basically exposes a generic iterator interface with the outside world. A reader is expected to take IO objects as input, like:

-FileStreams
-String representing a path to a file or directory
-Database tables
-etc

Typical responsabilities are implementing behavior to facilitate access to the parsing of input elements, this is mostly done overriding the #parserClass method and, in he case of XML input, accessing nodes through #accessNode:

Developers that wish to sequential processing of input with custom formats can simply specialize this subclass.

Instance Variables:
	contents		<String>		Contains the raw contents as retrieved from the initial user's instantiation.
"
Class {
	#name : #BioReader,
	#superclass : #BioNamedObject,
	#instVars : [
		'contents',
		'nextReader',
		'parser'
	],
	#category : #'BioTools-IO'
}

{ #category : #'instance creation' }
BioReader class >> filesFromXMLDirectory: aDirectoryString [
	" Answer a Collection of readers iterating over the files located at aDirectoryString "

	^ (self filesIn: aDirectoryString) asFileCollection
			select: [ : file | file isXML ]
			thenCollect: [ : file | self newFromXML: file contents ]
]

{ #category : #'instance creation' }
BioReader class >> for: aString [
	" Private - Answer a Class which is the preferred one for reading aString "

	^ self allSubclasses 
		detect: [ : cls | cls isPreferredFor: aString ]
		ifNone: [ self error: 'No preferred readers found' translated ]
]

{ #category : #private }
BioReader class >> isPreferredFor: aString [
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ false
]

{ #category : #'instance creation' }
BioReader class >> newFromFlat: aFileLocationOrString [
	" Answer a new reader using file located at aFileLocationOrString "

	| contents |
	
	contents := self openFileNamed: aFileLocationOrString.
	^ self new
		results: contents;
		yourself
]

{ #category : #'instance creation' }
BioReader class >> newFromFlatCollection: aCollectionOfFlat [
	" Answer a Collection of readers iterating over the Flat Strings at aCollectionOfFlat "

	^ aCollectionOfFlat collect: [ : string | self newFromFlat: string ]
]

{ #category : #'instance creation' }
BioReader class >> newFromFlatPath: aFileLocationOrString [
	" Answer a new reader using file located at aFileLocationOrString "

	^ (aFileLocationOrString contents isGenBankFlatFormat)
		ifTrue: [ self newFromFlat: aFileLocationOrString ]
		ifFalse: [ self filesFromFlatDirectory: aFileLocationOrString ]

]

{ #category : #'instance creation' }
BioReader class >> newFromXML: aString [
	" Answer a new reader using file located at aFileLocationOrString "

	^ self new
		results: aString;
		yourself
]

{ #category : #'instance creation' }
BioReader class >> newFromXMLCollection: xmlCollection [
	" Answer a Collection of readers iterating over the XML Strings at aCollectionOfXMLs "

	^ xmlCollection collect: [ : rsObject | self newFromXML: rsObject  result]
]

{ #category : #'instance creation' }
BioReader class >> newFromXMLFile: aFileLocation [
	" Answer a new receiver's instance using contents located at aFileLocationOrString "

	^ self new
		results: (self openFullFileNamed: aFileLocation) contents;
		yourself

]

{ #category : #'accessing parser' }
BioReader >> accessNode: aNodeName [
	" Private - Answer an object from the search result corresponding to aNodeName
	or raise an exception if there are no results in the receiver "
	
	| qResult |
	(qResult := self 
			selectNodes: (Array with: aNodeName)
			in: self results).
	^ qResult 
		at: aNodeName
		ifAbsent: [ self signalNotFound: 'Empty result set' translated ]
]

{ #category : #'accessing parser' }
BioReader >> accessNodes: aNodeName [
	" Private - Answer a Collection with search results corresponding to aNodeName
	or raise an exception if there are no results in the receiver "
	
	| qResult |
	^ (qResult := self 
			selectNodes: (Array with: aNodeName)
			in: self results) isEmpty
				ifFalse: [ qResult ]
				ifTrue: [ self signalInvalidObject: 'Empty result set' translated ]
]

{ #category : #accessing }
BioReader >> contents [

	^ contents
]

{ #category : #accessing }
BioReader >> contents: anObject [
	^ contents := anObject
]

{ #category : #accessing }
BioReader >> dumpToStream: aStream [

	contents
		ifNotNil: [ contents dumpToStream: aStream ]
]

{ #category : #testing }
BioReader >> hasContents [
	" Answer <true> if the receiver's contents is not empty "

	^ self contents notNil and: [ self contents notEmpty ]
]

{ #category : #accessing }
BioReader >> nextReader [

	^ nextReader
		ifNil: [ nextReader := self defaultNextReader ]
]

{ #category : #accessing }
BioReader >> nextReader: anObject [
	nextReader := anObject
]

{ #category : #'accessing parser' }
BioReader >> parse: anObject [

	^ self parser parse: anObject


	
]

{ #category : #'accessing parser' }
BioReader >> parseDocument [
	" Parse the receiver's contents and answer an Object as provided by the receiver's parser "
	
	^ self parse: contents


	
]

{ #category : #accessing }
BioReader >> parser [

	^ parser
		ifNil: [ parser := self parserClass ]
]

{ #category : #accessing }
BioReader >> parser: aParserClass [
	" Set the receiver's parser to aParserClass "
	
	parser := aParserClass
]

{ #category : #'accessing parser' }
BioReader >> parserClass [
	" Answer a Class responsible for parsing the receiver's contents or input "
	
	self subclassResponsibility
]

{ #category : #'accessing parser' }
BioReader >> results [
	"Answer the value of results"

	^ contents
]

{ #category : #'accessing parser' }
BioReader >> results: anObject [
	"Set the value of results"

	contents := anObject
]

{ #category : #'accessing parser' }
BioReader >> selectNodes: nodesCollection in: anObject [

	^ self parserClass 
			tokenizeNcbiXmlBlast: anObject contents 
			nodes: nodesCollection


	
]

{ #category : #accessing }
BioReader >> size [
	"Answer how many elements the receiver contains."

	^ contents
		ifNotNil: [ contents size ]
		ifNil: [ 0 ]
]
