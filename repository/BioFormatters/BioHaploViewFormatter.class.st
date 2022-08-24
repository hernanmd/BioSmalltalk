"
The case for the following example is an output file sent by Illumina and you want to export to HaploView format by Chromosome.

```language=Pharo
| inputCol exporter |

inputCol := Dictionary newFromPairs: {
	'resultChromo09.txt' . 621200 .
	'resultChromo10.txt' . 608980 .
	'resultChromo11.txt' . 640300 .
	'resultChromo12.txt' . 522540 .
	'resultChromo13.txt' . 471880 .		
	'resultChromo14.txt' . 495600 .
	'resultChromo15.txt' . 495100 .
	'resultChromo16.txt' . 483560 .
	'resultChromo17.txt' . 445320 . 		
	'resultChromo18.txt' . 387720 .
	'resultChromo19.txt' . 378160 .
	'resultChromo20.txt' . 429800 .
	'resultChromo21.txt' . 423500 .		
	'resultChromo22.txt' . 360680 .
	'resultChromo23.txt' . 304300 .
	'resultChromo24.txt' . 372400 .
	'resultChromo25.txt' . 258620 .	
	'resultChromo26.txt' . 304840 .
	'resultChromo27.txt' . 263040 .
	'resultChromo28.txt' . 260760 .
	'resultChromo29.txt' . 294200 }.

BioHaploViewFormatter
	folder: 'c:\IlluminaDB\'
	newOnInputFiles: inputCol 
	samples: #( 2734 2736 2737 2739 2744 2749 2750 2754 2762 2764 2765 2770 2777 2784 2790 2805 2810 2811 2814 2817 )
	affectionStatuses: #(1 2 1 2 2 2 1 2 2 2 1 1 1 2 1 1 1 2 1 2).
```

"
Class {
	#name : #BioHaploViewFormatter,
	#superclass : #BioMatrixFormatter,
	#instVars : [
		'samplesSize'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioHaploViewFormatter class >> description [
	" Private - See superimplementor's comment "

	^ 'HaploView Writer'
]

{ #category : #'instance creation' }
BioHaploViewFormatter class >> folder: aDirectoryString newOnInputFiles: inputFilenamesWithAffectedRows samples: aSamplesCollection affectionStatuses: affectionStatuses [

	inputFilenamesWithAffectedRows associationsDo: [ : assoc |
		| exporter |
		( exporter := self new ) outputFilename: 'output - ' , assoc key.
		exporter
			initializeWithInputFile: aDirectoryString , assoc key " filename "
			samples: aSamplesCollection
			affectedRows: assoc value. " affectedRowsCount "
		exporter
			fillPedigreeNames: 1;
			fillIndividualIDs;
			fillFatherIDs: 0;
			fillMotherIDs: 0;
			fillSex: 1;
			fillAffectionStatus: affectionStatuses;
			fillMatrix;
			exportMatrix ]
]

{ #category : #accessing }
BioHaploViewFormatter class >> identifiers [
	" Answer a <Collection> of identifiers of the receiver "
	
	^ #('HaploView' 'Linkage Desequilibrium' 'Genehunter''s TDT')
]

{ #category : #'instance creation' }
BioHaploViewFormatter class >> newOnInputFile: anInputFilename outputFile: anOutputFilename samples: aSamplesCollection affectedRows: affectedRowsCount [

	^ self new 
		initializeWithInputFile: anInputFilename 
		outputFile: anOutputFilename
		samples: aSamplesCollection
		affectedRows: affectedRowsCount
]

{ #category : #'instance creation' }
BioHaploViewFormatter class >> readFromCsv: csvFilename [
	" The case for the following example is an output file sent by Illumina and you want to export to HaploView format by chromosome. 
	
	BioHaploViewFormatter readFromCsv: ''
	"

	| inputCol |

	inputCol := Dictionary newFromPairs: { csvFilename . (self linesCount: csvFilename) }.
	self 
		folder: String empty
		newOnInputFiles: inputCol 
		samples: #()"#( 2734 2736 2737 2739 2744 2749 2750 2754 2762 2764 2765 2770 2777 2784 2790 2805 2810 2811 2814 2817 4921 4935 4944 4955 4958 4992 4999 5005 5011 5012 5014 5016 8030 8055 8061 8075)"
		affectionStatuses: #() "#(1 2 1 2 2 2 1 2 2 2 1 1 1 2 1 1 1 2 1 2 1 1 2 1 2 2 2 2 1 1 1 2 2 1 1 2)."
		
]

{ #category : #accessing }
BioHaploViewFormatter >> delimiter [
	" See superimplementor's comment "

	^ Character tab
]

{ #category : #accessing }
BioHaploViewFormatter >> delimiterSourceCharacter [
	" See superimplementor's comment "

	^ Character tab
]

{ #category : #exporting }
BioHaploViewFormatter >> exportCellAtRow: rIndex atColumn: cIndex [
	" Write the receiver's matrix cell content at rIndex and cIndex position "
	
	self outputFileStream 
			nextPutAll: (matrix at: rIndex at: cIndex) asString; 
			tab
]

{ #category : #populating }
BioHaploViewFormatter >> fillAffectionStatus: aValue [
	" Private - Refer to the HaploView documentation for details "

	self 
		atColumn: 6	
		fillWith: aValue



]

{ #category : #populating }
BioHaploViewFormatter >> fillFatherIDs: aValue [
	" Private - Refer to the HaploView documentation for details "

	self 
		atColumn: 3 
		fillWith: aValue.
	

]

{ #category : #populating }
BioHaploViewFormatter >> fillIndividualIDs [
	" Private - Refer to the HaploView documentation for details "

	self 
		atColumn: 2 
		fillWith: samplesCollection.
	

]

{ #category : #populating }
BioHaploViewFormatter >> fillMatrix [
	" Private - Matrix with nucleotide data in HaploView file format begins from the 7th column "
	
	| index |
	self bioLog: 'Filling matrix...'.
	index := 0.
	self parser rowsDo: [: rs |
		matrix 
			at: (index \\ samplesSize + 1)
			at: (index // samplesSize + 7)
			put: (self valueFor: rs).
		index := index + 1 ].
	self bioLog: 'Finished filling matrix'

]

{ #category : #populating }
BioHaploViewFormatter >> fillMotherIDs: aValue [
	" Private - Refer to the HaploView documentation for details "

	self atColumn: 4 fillWith: aValue.
	

]

{ #category : #populating }
BioHaploViewFormatter >> fillPedigreeNames: aValue [
	" Private - Refer to the HaploView documentation for details "

	self atColumn: 1 fillWith: aValue.
	

]

{ #category : #populating }
BioHaploViewFormatter >> fillSex: aValue [
	" Private - Refer to the HaploView documentation for details "

	self atColumn: 5 fillWith: aValue.

]

{ #category : #'initialize-release' }
BioHaploViewFormatter >> initializeWithInputFile: anInputFilename samples: aSamplesCollection affectedRows: affectedRowsCount [

	self parser: (self parserClass on: anInputFilename asFileReference readStream).
	self parser delimiter: self delimiter.

	samplesCollection := aSamplesCollection.
	samplesSize := aSamplesCollection size.

	self 
		initMatrixRows: samplesSize 
		columns: affectedRowsCount / self samplesSize + 6.


]

{ #category : #accessing }
BioHaploViewFormatter >> samplesSize [

	^ samplesSize
		ifNil: [ samplesSize := 1 ]
]

{ #category : #accessing }
BioHaploViewFormatter >> samplesSize: aNumber [
	" Set the receiver's number of samples to aNumber "

	samplesSize := aNumber
]

{ #category : #'initialize-release' }
BioHaploViewFormatter >> valueFor: rs [
	" Private - Assign a valid null value for HaploView file format.
	Write two alleles for a column, answer this 'column' (String delimited by space)
	Unread/invalid values from input assumed to be $- "
	
	^ String streamContents: [: str | 
		| allele1 allele2 |
		allele1 := rs third = '-' ifTrue: [ '0' ] ifFalse: [ rs third ].
		allele2 := rs fourth = '-' ifTrue: [ '0' ] ifFalse: [ rs fourth ].				
		str 
			nextPutAll: allele1; 
			space; 
			nextPutAll: allele2 ]
]
