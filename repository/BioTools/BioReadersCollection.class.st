Class {
	#name : #BioReadersCollection,
	#superclass : #BioOrderedCollection,
	#instVars : [
		'readerClass',
		'parser'
	],
	#category : 'BioTools-Collections'
}

{ #category : #'instance creation' }
BioReadersCollection class >> filesFromXMLDirectory: aDirectoryString [
	" Answer a new instance of the receiver with XML file contents from aDirectoryString "
	
	^ self withAll: ((BioObject filesIn: aDirectoryString) asFileCollection
			select: [ : file | file isXML ]
			thenCollect: [ : file | (BioReader for: file contents) newFromXML: file ]).
]

{ #category : #'instance creation' }
BioReadersCollection class >> newFromXMLCollection: xmlCollection [
	" Answer a new instance of the receiver with XML contents from xmlCollection "
	
	^ self withAll: (self readerClass newFromXMLCollection: xmlCollection).
]

{ #category : #accessing }
BioReadersCollection class >> readerClass [

	^ self subclassResponsibility
]

{ #category : #accessing }
BioReadersCollection >> fileOutXMLReaders [
	" Private - Helper method to be used inside an Inspector/Explorer to dump receiver's contents in XML files "

	| helper |
	helper := BioObject new.
	self doWithIndex: [ : r : index | 
		helper 
			dumpToFileNamed: index asString , BioNamedObject uniqueName , '.xml'
			contents: r contents ]
]

{ #category : #accessing }
BioReadersCollection >> parseDocuments [
	" Answer a <Collection> of <Dictionary> with qualifier -> value associations "
	
	| collection |
	
	collection := self species new: self size.
	self 
		do: [ : doc | collection addLast: doc parseDocument ]
		displayingProgress: 'Parsing...'.
	^ collection joinUsing: self species new
]

{ #category : #accessing }
BioReadersCollection >> parser [
	^ parser
]

{ #category : #accessing }
BioReadersCollection >> parser: aParser [
	" Set aParser to each of the receiver's elements "
	self do: [ : eachReader | eachReader parser: aParser ]
]

{ #category : #accessing }
BioReadersCollection >> readerClass [
	^ readerClass
]

{ #category : #accessing }
BioReadersCollection >> readerClass: anObject [
	readerClass := anObject
]
