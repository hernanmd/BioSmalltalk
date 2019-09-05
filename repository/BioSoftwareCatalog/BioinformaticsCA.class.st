"
Software Catalog for the software listed in the web site https://bioinformatics.ca/links_directory

To access its items evaluate:

BioinformaticsCA release.
BioinformaticsCA softwareList.


"
Class {
	#name : #BioinformaticsCA,
	#superclass : #BioSoftwareCatalog,
	#category : 'BioSoftwareCatalog-Core'
}

{ #category : #accessing }
BioinformaticsCA class >> caTSVFiles [
	" Answer a <Collection> of <FileReference> of TSV files "

	^ (self dataFilesFullDirectoryName / 'bioinformatics.ca') children
]

{ #category : #accessing }
BioinformaticsCA class >> defaultUpdateOnDemand [

	^ false
]

{ #category : #'initialize - release' }
BioinformaticsCA class >> initializeClassifications [

	^ (self softwareList collect: #classifications) asSet
]

{ #category : #'initialize - release' }
BioinformaticsCA class >> initializeSoftwareItems [
	" Private - Initialize software items to the receiver's catalog "

	^ (((self caTSVFiles 
			collect: [ : fileReference | self readTSVFileNamed: fileReference fullName ])
			 joinUsing: Array new)
				reject: #isNil) asSet
]

{ #category : #accessing }
BioinformaticsCA class >> newSoftwareItem: record [
	" Answer a new software item from entry Collection "
	
	^ BioSoftwareItem new 
		softwareName: record fifth;
		description: record sixth;
		link: record third;
		classifications: (self parseCategory: (record at: 10));
		yourself.

]

{ #category : #private }
BioinformaticsCA class >> parseCategory: aString [ 
	" 
	#('category_id:89812' 'category_name:Bio-* Programming Tools' 'category_path:Computer Related > Bio-* Programming Tools' 'category_id:89795' 'category_name:PHP' 'category_path:Computer Related > PHP')
	"

	^ aString notNil
		ifTrue: [ ((aString findTokens: ';') last findTokens: ':') last ]
		ifFalse: [ String empty ]

]

{ #category : #accessing }
BioinformaticsCA class >> readTSVFileNamed: aFilename [

	^ aFilename asFileReference readStreamDo: [ : stream |
			(NeoCSVReader on: stream)
				separator: Character tab;
				skipHeader;
				rowsCollect: [ : record | self readTSVItem: record ] ]
]

{ #category : #accessing }
BioinformaticsCA class >> readTSVItem: record [

	^ (record first = 'tool' and: [ record size > 7 ])
		ifTrue: [ self newSoftwareItem: record ]
		ifFalse: [ nil ]

]

{ #category : #accessing }
BioinformaticsCA class >> softwareListClassifiers [
	" Answer a <Collection> of qualifiers to be used for classifying software items. Tags were taken from the following sites "
	
	^ (self softwareList collect: #classifications) asSet
]
