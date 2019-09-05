"
Formatter for Affymetrix full TXT export.

Currently includes methods to extract specific columns from the report (i.e. #buildSNP_AllelesAB)

Details
======

Axiom full TXT reports currently starts with a header of 5 lines, example:

##package-file=\\FS3\data\Outputs\Run2\Batch3.suitcase
##annotation-file=C:\Users\Public\Documents\AxiomAnalysisSuite\Library\Axiom_GW_Bos_SNP_1.r3\Axiom_GW_Bos_SNP_1.na35.annot.db
##export-txt-file=C:\Users\Public\Documents\AxiomAnalysisSuite\Export\Exported_Forward-Strand-Base-Call.txt
##snp-count=5585
##samples-per-snp=94

Number of header lines to skip is configurable by setting headerLineCount

BioAffyTXTFormatter new
	inputFile: 'AFFY_TXT-Report.txt';
	readHeader.

"
Class {
	#name : #BioAffyTXTFormatter,
	#superclass : #BioFileFormatter,
	#instVars : [
		'headerLineCount',
		'refAlleleFieldName',
		'header',
		'chipSize',
		'columns'
	],
	#category : 'BioAffymetrix-Axiom'
}

{ #category : #accessing }
BioAffyTXTFormatter class >> description [
	" Private - See superimplementor's comment "

	^ 'Affymetrix TXT Formatter'
]

{ #category : #examples }
BioAffyTXTFormatter class >> example1 [ 
	<example>
	
	^ self new
		inputFile: 'Filtro_Bos1_comunes_consola_2.txt';
		headerLineCount: 6;		
		buildPositionSubset;
		yourself.

]

{ #category : #examples }
BioAffyTXTFormatter class >> example2 [
	<example>
	
	^ self new
		inputFile: 'Placas1-2_ArBos1_comunes_2.txt';
		headerLineCount: 6;
		buildPositionSubset;
		yourself.

]

{ #category : #examples }
BioAffyTXTFormatter class >> example3 [
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		commProbesFrom: 'affy_3727850132.txt' to: 'affy_3727849777.txt';
		yourself.

]

{ #category : #examples }
BioAffyTXTFormatter class >> example4 [
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		headerLineCount: 1;		
		inputFile: 'ComunesArBos1.csv';
		columns: 754;
		sortReport;
		yourself
]

{ #category : #examples }
BioAffyTXTFormatter class >> example5 [
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		headerLineCount: 1;
		inputFile: 'ComunesBos1.csv';
		columns: 377;
		sortReport;
		yourself
]

{ #category : #accessing }
BioAffyTXTFormatter class >> formatExtension [
	" Private - Answer a <String> corresponding for the receiver's file output format "

	^ 'txt'

]

{ #category : #accessing }
BioAffyTXTFormatter class >> identifiers [
	" See superimplementor's comment "
	
	^ #('TXT')
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> buildChrStart [
	" Answer a String with each row a SNP with Allele_A and Allele_B field values. The Allele_A is the allele of the SNP that is in lower alphabetical order "

	^ self buildColumns: { 
		self indexOfProbesetId . 
		self indexOfChrStart }
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> buildColumns: indexes [
	" Answer a <Collection> with columns at indexes. 

	This is similar to UNIX command : cut -f i1,i2,i3 file 
	"
	[ (NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		skipHeader: self headerLineCount + 1;
		rowsDo: [ : r | 
			self outputFileStream 
					nextPutAll: ((indexes collect: [ : i | r at: i ]) joinUsing: self delimiter);
					nextPutTerminator ] ]
	ensure: [ self outputFileStream close ]
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> buildPositionSubset [
	" Answer a <Collection> with position based (chr and start) subset "

	^ self sortByColumnsAt: { 
		self indexOfProbesetId . 
		self indexOfChr .
		self indexOfChrStart }
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> buildSNP_AlleleA [
	" Answer a String with each row a SNP with Allele_A and Allele_B field values. The Allele_A is the allele of the SNP that is in lower alphabetical order "

	^ self buildColumns: { 
		self indexOfProbesetId . 
		self indexOfAlleleA }
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> buildSNP_AllelesAB [
	" Answer a String with each row a SNP with Allele_A and Allele_B field values "

	^ self buildColumns: { 
		self indexOfProbesetId . 
		self indexOfAlleleA .
		self indexOfAlleleB }
]

{ #category : #private }
BioAffyTXTFormatter >> buildTXTArray [

	^ (NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		upToEnd.
]

{ #category : #accessing }
BioAffyTXTFormatter >> chipSize [
	^ chipSize
]

{ #category : #accessing }
BioAffyTXTFormatter >> chipSize: anObject [
	chipSize := anObject
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> collectAffyProbesAt: indexes to: outputCol [

	(NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		skipHeader: self headerLineCount + 1;
		rowsDo: [ :r | outputCol add: (self newAffyRecordAt: r using: indexes) ]
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> collectAffyProbesTo: outputCol [

	(NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		skipHeader: self headerLineCount;
		rowsDo: [ :r | outputCol add: (self newAffyRecordAt: r) ]
]

{ #category : #accessing }
BioAffyTXTFormatter >> columns [
	^ columns
]

{ #category : #accessing }
BioAffyTXTFormatter >> columns: anObject [
	columns := anObject
]

{ #category : #accessing }
BioAffyTXTFormatter >> commProbesFrom: csvFilename1 to: csvFilename2 [
	" 
	Compare two sorted affy CSV files exported from #sortByColumnsAt: line by line
	Does not check order (assume already sorted CSV files) "
	
	| affyChip1 affyChip2 |
	affyChip1 := self readProbesFrom: csvFilename1.
	affyChip2 := self readProbesFrom: csvFilename2.
	self dumpAffyProbes: (affyChip1 intersection: affyChip2) asSortedCollection.
	self resetOutput.
	self dumpAffyProbes: (affyChip2 intersection: affyChip1) asSortedCollection.

]

{ #category : #accessing }
BioAffyTXTFormatter >> delimiter [
	" Answer the <Character> used to delimit fields "
	
	^ Character tab
]

{ #category : #accessing }
BioAffyTXTFormatter >> dumpAffyProbes: outputCol [
	^ self outputFilename asFileReference
		writeStreamDo: [ :writeStream | 
			ZnBufferedWriteStream
				on: writeStream
				do: [ :bStream | 
					(NeoCSVWriter on: bStream)
						separator: self delimiter;
						addRawField: #id;
						addRawField: #chr;
						addRawField: #position;
						nextPutAll: (outputCol sortBlock: [ :a :b | a <= b ]) ] ]
]

{ #category : #accessing }
BioAffyTXTFormatter >> dumpAllAffyProbes: outputCol [

	^ self outputFilename asFileReference
		writeStreamDo: [ :writeStream | 
			ZnBufferedWriteStream
				on: writeStream
				do: [ :bStream | 
					(NeoCSVWriter on: bStream)
						separator: self delimiter;
						writeRawHeader: self header;
						addRawField: #id;
						addRawField: #chr;
						addRawField: #position;
						addRawField: #markers;
						nextPutAll: (outputCol sortBlock: [ :a :b | a <= b ]) ] ]
]

{ #category : #private }
BioAffyTXTFormatter >> fileNamePrefix [
	" Answer a default prefix <String> for the output file name "
	
	^ 'affy_'
]

{ #category : #'accessing-header' }
BioAffyTXTFormatter >> header [
	^ header
		ifNil: [ header := self readHeader ]
]

{ #category : #'accessing-header' }
BioAffyTXTFormatter >> header: anObject [
	header := anObject
]

{ #category : #'accessing-header' }
BioAffyTXTFormatter >> headerLineCount [

	^ headerLineCount

]

{ #category : #'accessing-header' }
BioAffyTXTFormatter >> headerLineCount: anObject [
	headerLineCount := anObject
]

{ #category : #accessing }
BioAffyTXTFormatter >> indexOfAlleleA [
	" Answer the column position of Allele_A field "

	^ self indexOfFieldNamed: 'Allele_A'
]

{ #category : #accessing }
BioAffyTXTFormatter >> indexOfAlleleB [
	" Answer the column position of Allele_B field "

	^ self indexOfFieldNamed: 'Allele_B'
]

{ #category : #accessing }
BioAffyTXTFormatter >> indexOfChr [
	" Answer the column position of Chr_id field "

	^ self indexOfFieldNamed: 'Chr_id'
]

{ #category : #accessing }
BioAffyTXTFormatter >> indexOfChrStart [
	" Answer the column position of Start field "

	^ self indexOfFieldNamed: 'Start'
]

{ #category : #accessing }
BioAffyTXTFormatter >> indexOfFieldNamed:fieldName [
	" Given fieldName answer a <Number> representing the position in the receiver's TXT file "
	
	^ self header indexOf: fieldName
]

{ #category : #accessing }
BioAffyTXTFormatter >> indexOfProbesetId [
	" Answer the column position of probeset_id field "

	^ self indexOfFieldNamed: 'probeset_id'
]

{ #category : #accessing }
BioAffyTXTFormatter >> newAffyRecordAt: row [

	| chr pos |
	chr := (row at: row size - 2)
		ifNil: [ 0 ]
		ifNotNil: [ : c | c  ].
	pos := (row at: row size - 1)
		ifNil: [ 0 ]
		ifNotNil: [ : p | p  ].
	^ BioAffyProbeSetRecord new
		id: (row at: 1);
		chr: chr asNumber;
		position: pos asNumber;
		markers: ((row copyFrom: 2 to: row size - 3) joinUsing: Character tab);
		yourself
	
]

{ #category : #accessing }
BioAffyTXTFormatter >> newAffyRecordAt: row using: indexes [

	| chr pos |
	chr := (row at: indexes second)
		ifNil: [ 0 ]
		ifNotNil: [ : c | c  ].
	pos := (row at: indexes third)
		ifNil: [ 0 ]
		ifNotNil: [ : p | p  ].
	^ BioAffyProbeSetRecord new
		id: (row at: indexes first);
		chr: chr asNumber;
		position: pos asNumber;
		yourself
	
]

{ #category : #'accessing-header' }
BioAffyTXTFormatter >> prvReadHeaderLineCount: value [
	" Answer a <String> containing the first line of the receiver's input file "

	^ self inputFile asFileReference readStreamDo: [ : readStream |
		(NeoCSVReader on: readStream)
			separator: self delimiter;
			skipHeader: value - 1;
			readHeader ].

]

{ #category : #private }
BioAffyTXTFormatter >> readHeader [
	" Answer a <String> containing the first line of the receiver's input file "

	^ self inputFile asFileReference readStreamDo: [ : readStream |
		(NeoCSVReader on: readStream)
			separator: self delimiter;
			skipHeader: 0;
			readHeader ].
			
]

{ #category : #'accessing-header' }
BioAffyTXTFormatter >> readHeaderLineCount [
	" Read and skip the first headerLineCount of the receiver's input file "

	^ self header: (self prvReadHeaderLineCount: self headerLineCount)

]

{ #category : #accessing }
BioAffyTXTFormatter >> readProbesFrom: csvFilename [
	" 
	Compare two sorted affy CSV files exported from #sortByColumnsAt: line by line
	Does not check order (assume already sorted CSV files) "
	
	^ csvFilename asFileReference readStreamDo: [ : fileStream |
		ZnBufferedReadStream on: fileStream do: [ : readStream |
			(NeoCSVReader on: readStream)
            separator: self delimiter;
				recordClass: BioAffyProbeSetRecord;
            addField: #id:;
            addIntegerField: #chr:;
            addIntegerField: #position:;
            upToEnd ] ].
]

{ #category : #accessing }
BioAffyTXTFormatter >> refAlleleFieldName [
	^ refAlleleFieldName
		ifNil: [ refAlleleFieldName := 'Allele_A' ]
]

{ #category : #accessing }
BioAffyTXTFormatter >> refAlleleFieldName: anObject [
	refAlleleFieldName := anObject
]

{ #category : #accessing }
BioAffyTXTFormatter >> referenceAlleles [
	" Answer a <Collection> with receiver's reference alleles "

	| txtArray refAlleleIndex |
	txtArray := self buildTXTArray.
	refAlleleIndex := txtArray first 
		indexOf: self refAlleleFieldName 
		ifAbsent: [ ^ self signalNotFound: self refAlleleFieldName ].
	^ (txtArray collect: [ : row | row at: refAlleleIndex ]) allButFirst
	
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> sortByColumnsAt: indexes [
	" Answer a <Collection> with columns at indexes. "

	[ 
	| outputCol |
	outputCol := SortedCollection new: self chipSize.
	self collectAffyProbesAt: indexes to: outputCol.
	self dumpAffyProbes: outputCol 
	]
	ensure: [ self outputFileStream close ]
]

{ #category : #'accessing-columns' }
BioAffyTXTFormatter >> sortReport [
	" Answer a <Collection> with columns at indexes. "

	[ 
	| outputCol |
	outputCol := SortedCollection new: self chipSize.
	self collectAffyProbesTo: outputCol.
	self dumpAllAffyProbes: outputCol 
	]
	ensure: [ self outputFileStream close ]
]
