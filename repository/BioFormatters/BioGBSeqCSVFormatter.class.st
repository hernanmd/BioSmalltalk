"
BioGBSeqCSVFormatter read results from Entrez GBSeq and write a CSV. This class needs work.

| readers formatter |
readers := BioGBSeqCollection filesFromXMLDirectory: BioNCBIGenBankReaderTest testFilesDirectoryName.
readers parseDocuments.
formatter := BioFileFormatter formatterFor: 'GBSeqReport'.
formatter 
	exportFrom: readers 
	interval: (16023 to: 16262).
"
Class {
	#name : #BioGBSeqCSVFormatter,
	#superclass : #BioCSVFormatter,
	#instVars : [
		'features'
	],
	#category : #'BioFormatters-Formatters-CSV'
}

{ #category : #accessing }
BioGBSeqCSVFormatter class >> description [
	" See superimplementor's comment "

	^ 'CSV from Entrez GenBank Collection'
]

{ #category : #accessing }
BioGBSeqCSVFormatter class >> identifiers [
	" See superimplementor's comment "
	
	^ #('GBSeqCSV')
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> cellDataFrom: aDictionary  atFeature: featureName [

	^ aDictionary 
		at: featureName 
		ifAbsent: [ '-' ]
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> dumpCellFrom: featureName cellData: cellData [

	(self isExcludedFeature: featureName)
		ifFalse: [ 	
			stream 
				nextPutAll: cellData;
				nextPut: self delimiterSourceCharacter ]
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> dumpFeatureData: aDictionary groupingFeature: ttyName [ 

	self features 
		do: [: featureName |
			self 
				dumpCellFrom: featureName 
				cellData: (self cellDataFrom: aDictionary atFeature: featureName). ]
		displayingProgress: 'Writing CSV data to ' , self outputFilename.
	stream nextPutAll: GRPlatform current newline.

]

{ #category : #accessing }
BioGBSeqCSVFormatter >> exportFrom: aCollection [
	" Export default features "

	self initializeStream: aCollection.
	self writeHeaderFrom: self features.
	self writeUnclassifiedRowsFrom: aCollection.
	self 
		dumpToFileNamed: self outputFilename 
		contents: stream contents.
	self bioLog: 'Exported CSV contents in file ' , self outputFilename.
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> exportFrom: data features: fCollection [
	" Export data into receiver's format using features contained in fCollection "
	
	self features: fCollection.
	self initializeStream: data.
	self writeHeaderFrom: self features.
	self writeUnclassifiedRowsFrom: data.
	self 
		dumpToFileNamed: self outputFilename 
		contents: stream contents.
	self bioLog: 'Exported CSV contents in file ' , self outputFilename.

]

{ #category : #accessing }
BioGBSeqCSVFormatter >> exportFrom: aCollection interval: interval [

	self flag: #checkIfUseful.
	self initializeStream: aCollection.
	" Escribir la fila de columnas "
	self features allButLast do: [: k |
		stream 
			nextPutAll: k;
			nextPut: self delimiterSourceCharacter ].
	" Escribir las posiciones "
	interval do: [ : pos | 
		stream 
			nextPutAll: pos asString;
			nextPut: self delimiterSourceCharacter ].
	stream cr.
	" Escribir los valores "
	aCollection do: [: dict |
		self features do: [: key |
			stream 
				nextPutAll: ( dict at: key ifAbsent: [ '-' ] );
				nextPut: self delimiterSourceCharacter ].
			stream cr ].
	self 
		dumpToFileNamed: self outputFilename 
		contents: stream contents
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> features [
	^ features
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> features: anObject [
	features := anObject
]

{ #category : #initialize }
BioGBSeqCSVFormatter >> initialize [

	super initialize.
	" Because some records contain delimiters "
	self delimiterSourceCharacter: $|
]

{ #category : #testing }
BioGBSeqCSVFormatter >> isExcludedFeature: featureName [

	^ featureName = 'Recognized Region' or: [ featureName = 'BlastNode' ]
]

{ #category : #accessing }
BioGBSeqCSVFormatter >> sizeFrom: collection [

	^  collection sum: [: d | d sum: #size ]
]

{ #category : #private }
BioGBSeqCSVFormatter >> writeClassifiedRowsFrom: data [
	" Private - Assume data is a <Dictionary> with each Association a pair <String> -> <OrderedCollection>
	features contain all possible features in data. if data at specific feature is absent, then use a dash to specify null value "

	data associationsDo: [: assoc |
		assoc value do: [ : dict | 
			self dumpFeatureData: dict groupingFeature: assoc key ] ] .
	self informMessage: 'Exported CSV data to ' , self outputFilename

]

{ #category : #private }
BioGBSeqCSVFormatter >> writeHeaderFrom: featureCollection [
	" Private - Write header row from featureCollection in receiver's stream "
	
	featureCollection do: [: featureName |
		(self isExcludedFeature: featureName)
			ifFalse: [ 
				stream 
					nextPutAll: featureName;
					nextPut: self delimiterSourceCharacter ] ].	
	stream nextPutAll: GRPlatform current newline.	
		
]

{ #category : #private }
BioGBSeqCSVFormatter >> writeUnclassifiedRowsFrom: data [
	" Private - Assume data is a <Collection> of <Dictionary>. 
	features contain all possible features in data. if data at specific feature is absent, then use a dash to specify null value "

	data do: [: dict |
		self dumpFeatureData: dict groupingFeature: 'Unrecognized' ] .
	self informMessage: 'Exported CSV data to ' , self outputFilename
	

]
