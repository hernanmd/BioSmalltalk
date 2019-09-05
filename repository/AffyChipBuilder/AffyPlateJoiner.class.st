"
AffyPlateJoiner new
	rootDirectory:  'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\CSVs' ;
	readAllSamples. 

AffyPlateJoiner new
	rootDirectory:  '/usr/local/data/proyectos/microarray_igevet_2016/data/Info_Corridas_Placas(CSVs)' ;
	sampleIDsFile: 'Sample_IDs-P1-4.csv';
	readAllSamples. 

| illuminaAffySNPs illuminaAffyFilename affy640SNPIds affy640Header affyExportFilename rejectedSNPs |

affyExportFilename := 'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\BOS1_Placas-1_3-transposed.txt'.
illuminaAffyFilename := 'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\illuaffy.csv'.

illuminaAffySNPs := illuminaAffyFilename asFileReference readStreamDo: [ : stream |
	(NeoCSVReader on: stream)
		separator: $,;
		skipHeader;
		rowsCollect: [ : record | (record at: 25) asUppercase ] ].
	
affy640SNPIds := affyExportFilename asFileReference readStreamDo: [ : stream | 
	(NeoCSVReader on: stream)
		separator: Character tab;
		readHeader ].

affy640SNPIds doWithIndex: [ : record : index | (illuminaAffySNPs includes: record) ifFalse: [ rejectedSNPs add: index ] ].
self halt.

affy640Header := (NeoCSVReader on: affyExportFilename asFileReference readStream) readHeader.

'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\Affy_Illumina_CommonSNPs.csv' asFileReference writeStreamDo: [ : fstream | 	
	ZnBufferedWriteStream on: fstream do: [ :stream |
		(NeoCSVWriter on: stream) 
			fieldWriter: #raw;
			separator: Character tab;
			writeHeader: affy640Header;
			nextPutAll: affy640SNPIds;
			flush ] ].
"
Class {
	#name : #AffyPlateJoiner,
	#superclass : #Object,
	#instVars : [
		'affySamples',
		'breedMappings',
		'sexMappings',
		'joinedAffySamplesId',
		'rootDirectory',
		'sampleIDsFile'
	],
	#category : 'AffyChipBuilder'
}

{ #category : #accessing }
AffyPlateJoiner >> affySamples [
	^ affySamples
		ifNil: [ affySamples := OrderedCollection new ]
]

{ #category : #accessing }
AffyPlateJoiner >> affySamples: anObject [
	affySamples := anObject
]

{ #category : #accessing }
AffyPlateJoiner >> breedMappings [

	^ breedMappings 
		ifNil: [ breedMappings := self initializeBreedMappings ]
]

{ #category : #normalization }
AffyPlateJoiner >> initializeBreedMappings [

	^ Dictionary newFromPairs: { 
		'brangus' . 				'BRANG' .
		'aberdeen angus' . 			'ANGUS' .
		'brahman' . 				'BRAH' .
		'yacumeños' . 				'YAC' .
		'criollos bolivianos' . 		'CRBOL' .
		'criollos argentinos' . 		'CRARG' .
		'criollos saavedreños' .	 	'CRSAAV'  }
]

{ #category : #normalization }
AffyPlateJoiner >> initializeSexMappings [

	^ Dictionary newFromPairs: { 
		'male' . 		'M' .
		'female' . 		'F' .
		'macho' . 		'M' .
		'hembra' . 	'F'  }
]

{ #category : #testing }
AffyPlateJoiner >> isIncludedInGIR: aStringID [ 

	^ ((self readSamplesC: self rootDirectory / 'Gir_IndivIDs.txt') collect: #first) includes: aStringID first.
]

{ #category : #accessing }
AffyPlateJoiner >> joinSamples [

	| joinedSamples joinedAffySamples |
	
	joinedAffySamples := (self affySamples joinUsing: Array new) reject: #isNil.
	joinedAffySamplesId := joinedAffySamples collect: #first.
	joinedSamples := OrderedCollection new: joinedAffySamples size.
	self readOrderedIndivs do: [ : i | 
		joinedAffySamples 
			detect: [ : s | s first = i ] 
			ifFound: [ : found | joinedSamples add: found ]
			ifNone: [ "joinedSamples add: (Array with: i with: self nullIdentifier with: self nullIdentifier)" ] ].
	^ joinedSamples 

]

{ #category : #normalization }
AffyPlateJoiner >> normalizeId: aString [ 

	^ (aString findTokens: $_) second copyUpTo: $..

]

{ #category : #normalization }
AffyPlateJoiner >> normalizeRecord: record [

	| rec |
	
	^ ((rec := self normalizeId: record first) beginsWithSubCollection: '0')
		ifTrue: [ rec allButFirst ]
		ifFalse: [ rec ]
]

{ #category : #normalization }
AffyPlateJoiner >> normalizedBreed: aString [

	^ self breedMappings
		at: aString asLowercase 
		ifPresent: [ : f | f ] 
		ifAbsent: [ aString ]
]

{ #category : #normalization }
AffyPlateJoiner >> normalizedSex: aString [

	^ self sexMappings
		at: aString asLowercase 
		ifPresent: [ : f | f ] 
		ifAbsent: [ aString ]

]

{ #category : #constants }
AffyPlateJoiner >> nullIdentifier [

	^ '---'
]

{ #category : #constants }
AffyPlateJoiner >> outputFilename [

	^ (self rootDirectory / 'BOS1-Placas_1-4-Cols-SEX-FAM_AffyPlateJoiner-Pharo.csv') fullPath
]

{ #category : #scanning }
AffyPlateJoiner >> readAllSamples [

	self affySamples 
		add: (self readSamplesA: self rootDirectory / 'IGEVETAX_Sample_Table-FinalSampleTable.csv');
		add: (self readSamplesB: self rootDirectory / 'PlateAFFYM_BOS_I_Entre24Nov22NonBN-Hoja2.csv');
		add: (self readSamplesB: self rootDirectory / '20150906_Bos1_GT4-PlacaGT4.csv');
		add: (self readSamplesC: self rootDirectory / 'Gir_IndivIDs.txt');
		yourself.
	self writeSamples: self joinSamples.
	
	
]

{ #category : #scanning }
AffyPlateJoiner >> readOrderedIndivs [

	^ (self rootDirectory / self sampleIDsFile) asFileReference readStreamDo: [ : stream |
		(NeoCSVReader on: stream)
			separator: Character tab;
			rowsCollect: [ : record | 
				(self isIncludedInGIR: record)
					ifTrue: [ record first ]
					ifFalse: [  self normalizeRecord: record ] ] ]
]

{ #category : #scanning }
AffyPlateJoiner >> readSamplesA: fileName [

	^ fileName asFileReference readStreamDo: [ : stream |
			(NeoCSVReader on: stream)
				separator: Character tab;
				skipHeader;
				rowsCollect: [ : record | 
					((record at: 16) isNil or: [ (record at: 22) isNil ])
					ifFalse: [ 
						Array 
							with: (self normalizeId: record ninth)
							with: (self normalizedSex: (record at: 16))
							with: (self normalizedBreed: (record at: 22)) ] ] ].

]

{ #category : #scanning }
AffyPlateJoiner >> readSamplesB: fileName [

	^ fileName asFileReference
		readStreamDo: [ :stream | 
			(NeoCSVReader on: stream)
				separator: Character tab;
				skipHeader;
				rowsCollect: [ :record | 
					(record fifth isNil or: [ record sixth isNil ])
						ifFalse: [ Array
								with: record third
								with:
									(record fifth
										ifNil: [ self nullIdentifier ]
										ifNotNil: [ :arg | self normalizedSex: record fifth ])
								with:
									(record sixth
										ifNil: [ self nullIdentifier ]
										ifNotNil: [ :arg | self normalizedBreed: record sixth ]) ] ] ]
]

{ #category : #scanning }
AffyPlateJoiner >> readSamplesC: fileName [

	^ fileName asFileReference
		readStreamDo: [ :stream | 
			(NeoCSVReader on: stream)
				separator: Character tab;
				rowsCollect: [ :record | 
					Array
						with: record first
						with: 'M'
						with: 'GIR' ] ]
]

{ #category : #accessing }
AffyPlateJoiner >> rootDirectory [

	^ rootDirectory asFileReference

	
]

{ #category : #accessing }
AffyPlateJoiner >> rootDirectory: anObject [
	rootDirectory := anObject
]

{ #category : #accessing }
AffyPlateJoiner >> sampleIDsFile [
	" El SampleIDs debe ser obtenido de la primera columna del PED generado por el Axiom "
	
	^  sampleIDsFile
]

{ #category : #accessing }
AffyPlateJoiner >> sampleIDsFile: anObject [
	sampleIDsFile := anObject
]

{ #category : #accessing }
AffyPlateJoiner >> sexMappings [

	^ sexMappings
		ifNil: [ sexMappings := self initializeSexMappings ]
]

{ #category : #accessing }
AffyPlateJoiner >> writeSamples: aCollection [

	self outputFilename asFileReference writeStreamDo: [ : fstream | 	
		ZnBufferedWriteStream on: fstream do: [ :stream |
			(NeoCSVWriter on: stream) 
				fieldWriter: #raw;
				separator: Character tab;
				nextPutAll: aCollection;
				flush ] ].

	
]
