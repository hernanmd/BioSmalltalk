Class {
	#name : #AffyHaploViewJoiner,
	#superclass : #Object,
	#instVars : [
		'affyReportFile',
		'haploViewReportFile'
	],
	#category : 'AffyChipBuilder'
}

{ #category : #accessing }
AffyHaploViewJoiner >> affyReportFile [
	^ affyReportFile
]

{ #category : #accessing }
AffyHaploViewJoiner >> affyReportFile: anObject [
	affyReportFile := anObject
]

{ #category : #accessing }
AffyHaploViewJoiner >> haploViewReportFile [
	^ haploViewReportFile
]

{ #category : #accessing }
AffyHaploViewJoiner >> haploViewReportFile: anObject [
	haploViewReportFile := anObject
]

{ #category : #scanning }
AffyHaploViewJoiner >> readAllSamples [

	self affySamples 
		add: (self readSamplesA: self rootDirectory / 'IGEVETAX_Sample_Table-FinalSampleTable.csv');
		add: (self readSamplesB: self rootDirectory / 'PlateAFFYM_BOS_I_Entre24Nov22NonBN-Hoja2.csv');
		add: (self readSamplesB: self rootDirectory / '20150906_Bos1_GT4-PlacaGT4.csv');
		add: (self readSamplesC: self rootDirectory / 'Gir_IndivIDs.txt');
		yourself.
	self writeSamples: self joinSamples.
	
]

{ #category : #accessing }
AffyHaploViewJoiner >> readHaploViewReport [

	self haploViewReport
	
]

{ #category : #accessing }
AffyHaploViewJoiner >> readRSaxDirectory [

	df := Dictionary new.
	self sourceDirectory asFileReference entries doWithIndex: [ : entry : index |
		self readRSaxFile: entry index: index	].

]

{ #category : #accessing }
AffyHaploViewJoiner >> readRSaxFile: entry index: index [

	| fref | 
	fref := entry asFileReference.
	fref readStreamDo: [ : reportStream |
		self 
			readRSaxStream: reportStream 
			fileName: fref 
			index: index  ] 


]

{ #category : #accessing }
AffyHaploViewJoiner >> readRSaxStream: stream fileName: fileName index: index [ 

	('out_' , fileName basename) asFileReference writeStreamDo: [ : str | 
		self writeStream: str readStream: stream index: index ] 


]

{ #category : #accessing }
AffyHaploViewJoiner >> writeSamples: aCollection [

	self outputFilename asFileReference writeStreamDo: [ : fstream | 	
		ZnBufferedWriteStream on: fstream do: [ :stream |
			(NeoCSVWriter on: stream) 
				fieldWriter: #raw;
				separator: Character tab;
				nextPutAll: aCollection;
				flush ] ].

]

{ #category : #accessing }
AffyHaploViewJoiner >> writeStream: str readStream: stream index: index [

	| csvWriter |
	csvWriter := (NeoCSVWriter on: (ZnBufferedWriteStream on: str))
					separator: Character tab;
					writeHeader: #('Well' 'Start_Pos' 'End_Pos' 'rs' 'HWpval') , famNamesAB;
					fieldWriter: #raw;
					yourself.
	(NeoCSVReader on: stream)
		separator: Character tab;
		rowsCollect: [ :record | self writeRecord: record on: str csvWriter: csvWriter ].
	csvWriter flush


]
