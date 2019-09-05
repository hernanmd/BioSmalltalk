"
BioSmalltalk abstract class for supporting behavior related with importing data from textual dictionaries. Currently expects a CSV stream and subclasses redefine import methods, for example starting at #addPopulationFromCsvRow:

Importers are used by Population Repositories.

To obtain a list of current importers given a <String> use #importersFor:

Instance Variables
	newBreed:		<Object>

newBreed
	- xxxxx

"
Class {
	#name : #BioPopImporter,
	#superclass : #BioObject,
	#classInstVars : [
		'newBreed'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioPopImporter class >> addPopulationFromCsvRow: row [

	self subclassResponsibility 
]

{ #category : #'initialize-release' }
BioPopImporter class >> importFromFile: rawDataFilePath [
	" 
	Read breed data from raw file, parse and build the receiver's repository 
	"
	| parser |
	
	parser := NeoCSVReader on: (self openFileNamed: rawDataFilePath) readStream.
	parser 
		separator: $;;
		converter: self parserConverter;
		do: [ : row | self addPopulationFromCsvRow: row ].
]

{ #category : #'initialize-release' }
BioPopImporter class >> importersFor: popIdString [
	" Answer a Collection of subclasses which can import a popIdString "
	
	^ self allFinalClasses select: [: cls | cls imports: popIdString ]
]

{ #category : #private }
BioPopImporter class >> importsVersionAt: aString [

	^ aString = self repositoryName
]

{ #category : #'initialize-release' }
BioPopImporter class >> initializeFor: aString [
	" Initialize each importer corresponding aString "

	(self importersFor: aString) do: [ : cls | 
		self bioLog: 'Initializing importer...' , cls asString.
		cls initialize ]
]

{ #category : #accessing }
BioPopImporter class >> newPopulation [
	^ newBreed
]

{ #category : #accessing }
BioPopImporter class >> newPopulation: anObject [
	newBreed := anObject
]

{ #category : #'initialize-release' }
BioPopImporter class >> parserConverter [
	" Private - Answer an appropriate converter for the current platform "
	
	^ Latin1TextConverter new
]

{ #category : #private }
BioPopImporter class >> rawDataFilePath [
	" Answer a <String> with receiver's location to the repository file(s) "
	
	self subclassResponsibility
]

{ #category : #'initialize-release' }
BioPopImporter class >> versionImporterAt: aString [
	" Answer a Class suitable for importing aString "

	^ self allSubclasses detect: [: cls | cls importsVersionAt: aString ]
]
