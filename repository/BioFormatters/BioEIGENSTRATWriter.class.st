"
A BioEigenStratWriter reads

-A .PED file 
-A .CSV file with allele frequencies (from MSTools)

writes

-A .SNP file in EigenStrat format (from EigenSoft)
-A .GENO file

Conversion table for formats:

.geno + .snp + .ind = eigenstrat format
.ped + .pedsnp + .pedind = ped format
.ancestrymapgeno + .snp + .ind = ancestrymap format
.bed + .pedsnp + .pedind = packedped = PLINK format
.packedancestrymapgeno + .snp + .ind = packedancestrymap format

Implementation notes:

It uses two parsers: One for the PED fie, used to fill the genotype matrix and another one for a CSV file, to fill the name and positions.


"
Class {
	#name : #BioEIGENSTRATWriter,
	#superclass : #BioMatrixFormatter,
	#instVars : [
		'alleleFqs',
		'strName',
		'rowIndex',
		'fCounter',
		'markers',
		'genoMatrix'
	],
	#category : 'BioFormatters-Formatters'
}

{ #category : #accessing }
BioEIGENSTRATWriter class >> description [
	" See superimplementor's comment "
	
	^ 'EIGENSOFT Eigenstrat Formatter/Writer'
]

{ #category : #examples }
BioEIGENSTRATWriter class >> example1 [

	| snpWriter pedFile alleleFqs   |

	pedFile := self testFilesFullDirectoryName / 'sample_strs.ped'.
	" allele frequencies from MSTools plugin "
	alleleFqs := self testFilesFullDirectoryName / 'sample_allele_fqs.csv'.

	snpWriter := BioEIGENSTRATWriter new
				alleleFqs: alleleFqs;
				outputFilename: 'eig_output.snp';
				pedFile: pedFile;
				yourself.
	snpWriter writeAsEigenStrat.
]

{ #category : #examples }
BioEIGENSTRATWriter class >> testFilesFullDirectoryName [

	^ super testFilesFullDirectoryName / 'eigenstrat'
]

{ #category : #accessing }
BioEIGENSTRATWriter >> alPositionsForMarker: a1 [
	" Answer a <Collection> of allele positions for marker position a1 "
	
	^ self markers at: (self markers keys at: a1).
		
]

{ #category : #accessing }
BioEIGENSTRATWriter >> alleleFqs [
	^ alleleFqs
]

{ #category : #accessing }
BioEIGENSTRATWriter >> alleleFqs: aFileReference [

	alleleFqs := aFileReference
]

{ #category : #exporting }
BioEIGENSTRATWriter >> exportCellDelimiter [
	" Private - See superimplementor's comment "
	
	self delimiter isNil 
		ifFalse: [ self outputFileStream nextPut: Character tab ].
]

{ #category : #private }
BioEIGENSTRATWriter >> fillGenotypeCellAlleles: alArray allelePosition: alPos row: currentGenoRow col: currentGenoCol [

	alArray do: [ : allele | 
		| colPos genoValue |
		genoValue := self genotypeValueAt: alArray.
		(allele = '0' and: [ currentGenoRow = 0 ]) 
			ifTrue: [ colPos := currentGenoRow + 1 ]
			ifFalse: [ colPos := (currentGenoRow + (alPos indexOf: allele)) ].
		self genoMatrix 
			at: colPos 
			at: currentGenoCol 
			put: genoValue ]
]

{ #category : #accessing }
BioEIGENSTRATWriter >> fillGenotypeMatrix [
	| parserForPed |

	parserForPed := self setParserForPed.
	self genoMatrix: (self newGenotypeMatrix: parserForPed).
	self fillGenotypeMatrixFrom: parserForPed.
	^ self genoMatrix
]

{ #category : #accessing }
BioEIGENSTRATWriter >> fillGenotypeMatrixFrom: parserForPed [
	| currentGenoCol |

	" counter from marker names "
	currentGenoCol := 1.
	parserForPed 
		reset;
		text;
		rowsDo: [ : row | 
		| a1 a2 index maxCols currentGenoRow |
		index := 1.		
		a1 := 1.
		a2 := 2.		
		maxCols := row size - 6.		
		currentGenoRow := 0.		
		[ a1 <= maxCols and: [ a2 <= maxCols ] ]
			whileTrue: [ 
				| alArray alPos |
				alPos := self alPositionsForMarker: index.				
				alArray := self genotypeArrayAt: (row allButFirst: 6) a1: a1 a2: a2.
				self fillGenotypeCellAlleles: alArray allelePosition: alPos row: currentGenoRow col: currentGenoCol.
				currentGenoRow := currentGenoRow + alPos size.
				index := index + 1.			
				a1 := a1 + 2.
				a2 := a2 + 2 ].
		currentGenoCol := currentGenoCol + 1 ].
]

{ #category : #private }
BioEIGENSTRATWriter >> fillSNPMatrix [
	" Private - Write the receiver's SNP output matrix (this is the .snp or .map file)"

	self fillSNPMatrixSTRNameColumn.
	self fillSNPMatrixSTRPositions.


]

{ #category : #private }
BioEIGENSTRATWriter >> fillSNPMatrixPosition: gPos [
	" Private - Write SNP matrix current row with gPos values "

	self matrix 
		at: rowIndex at: 2 put: $1;	
		at: rowIndex at: 3 put: '0.' , gPos;
		at: rowIndex at: 4 put: gPos;
		at: rowIndex at: 5 put: $1;
		at: rowIndex at: 6 put: $2.
]

{ #category : #private }
BioEIGENSTRATWriter >> fillSNPMatrixSTRName: row [
	" Private - Append separator between SNP or Microsatellite name and allele number at current row "
	
	(row allSatisfy: #isNil) not
		ifFalse: [ ^ self ].
	(row notEmpty and: [ self isLocusName: row ])
		ifTrue: [ self strName: row first , ':' ]
		ifFalse: [ 
			self matrix at: rowIndex at: 1 put: self strName , row first.
			rowIndex := rowIndex + 1 ]

]

{ #category : #private }
BioEIGENSTRATWriter >> fillSNPMatrixSTRNameColumn [
	" Private - Configure the parser for allele frequencies as produced from MSTools.
	Set the SNP matrix values accordingly "

	rowIndex := 1.
	self setParserForAlleleFqs.
	self preallocateMatrix.
	self setParserForAlleleFqs.
	self parser rowsDo: [ : row | self fillSNPMatrixSTRName: row ]


]

{ #category : #private }
BioEIGENSTRATWriter >> fillSNPMatrixSTRPositions [

	rowIndex := 0.
	fCounter := 0.
	(self matrix atColumn: 1) do: [ : row | self fillSNPMatrixSTRPositions: row ].



]

{ #category : #private }
BioEIGENSTRATWriter >> fillSNPMatrixSTRPositions: currentStrname [

	| gPos |
	" If breed has changed, increment breed counter "
	(currentStrname allButLast: 3) = strName
		ifFalse: [ fCounter := fCounter + 1.
				strName := (currentStrname allButLast: 3) ].
	gPos := (fCounter printPaddedWith: $0 to: 2) , (rowIndex printPaddedWith: $0 to: 3).
	rowIndex := rowIndex + 1.	
	self fillSNPMatrixPosition: gPos.

]

{ #category : #accessing }
BioEIGENSTRATWriter >> genoMatrix [
	^ genoMatrix
]

{ #category : #accessing }
BioEIGENSTRATWriter >> genoMatrix: anObject [
	genoMatrix := anObject
]

{ #category : #accessing }
BioEIGENSTRATWriter >> genotypeArrayAt: row a1: a1 a2: a2 [
	" Answer array values at position a1 and a2 in row "

	^ ((row at: a1) = 0 and: [ (row at: a2) = 0 ])
		ifTrue: [ Array empty ]
		ifFalse: [ 
			(row at: a1) = (row at: a2)
				ifTrue: [ Array with: (row at: a1) ]
				ifFalse: [ Array with: (row at: a1) with: (row at: a2) ] ].

]

{ #category : #accessing }
BioEIGENSTRATWriter >> genotypeValueAt: alArray [
	"
  0 means zero copies of reference allele.
  1 means one copy of reference allele.
  2 means two copies of reference allele.
  9 means missing data.	
	"
	^ alArray size = 1 
			ifTrue: [ 
				(alArray at: 1) = '0'
					ifTrue: [ 9 ]
					ifFalse: [ 2 ] ]
			ifFalse: [ 
				alArray size = 2
				ifTrue: [ 
					((alArray at: 1) = '0' and: [ (alArray at: 2) = '0' ])
						ifTrue: [ 9 ]
						ifFalse: [ 1 ] ] ].

]

{ #category : #private }
BioEIGENSTRATWriter >> includesAlleleFrq: aRow [ 
	" Private - Answer <true> if aRow is valid and contains allele frequency data "
	
	| locus |
	
	locus := aRow first.
	^ locus notNil and: [ locus first isLetter not ]
]

{ #category : #'initialize-release' }
BioEIGENSTRATWriter >> initialize [

	rowIndex := 0.
]

{ #category : #accessing }
BioEIGENSTRATWriter >> initializeMarkers [

	markers := OrderPreservingDictionary new.
	(matrix columnAt: 1) do: [ : marker |  | markerName markerAl |
		markerName := marker copyUpTo: $:.
		markerAl := marker copyAfter: $:.
		markers isEmpty
			ifTrue: [ (markers at: markerName ifAbsentPut: [OrderedCollection new]) add: markerAl ]
			ifFalse: [ markers at: markerName 
				ifPresent: [: m | m add: markerAl ] 
				ifAbsent: [ (markers at: markerName ifAbsentPut: [OrderedCollection new]) add: markerAl ] ] ].
]

{ #category : #private }
BioEIGENSTRATWriter >> isLocusName: aRow [

	^ aRow first notNil and: [ aRow first first isLetter ]
]

{ #category : #accessing }
BioEIGENSTRATWriter >> markers [

	^ markers
		ifNil: [ self initializeMarkers.
			markers ]
]

{ #category : #accessing }
BioEIGENSTRATWriter >> newGenotypeMatrix: parserForPed [
	" Answer a new matrix initialized from parserForPed settings.
	Matrix is initialized with all 0's. "
	
	| numberOfColumns |

	numberOfColumns := parserForPed numRows // 2.	
	^ self matrixClass 
			rows: self matrix numberOfRows 
			columns: numberOfColumns 
			element: 0.
]

{ #category : #private }
BioEIGENSTRATWriter >> parserClass [ 
	" Answer a default parser class "

	^ NeoCSVReader
]

{ #category : #accessing }
BioEIGENSTRATWriter >> pedFile [
	" Answer a <FileStream> of the input PED file : 
	PED format details:
		One line per individual
		Each line contains 6 or 7 columns of information about the individual, plus two genotype columns for each SNP in the order the SNPs are specified in the snp file. 
		Genotype format MUST be either 0ACGT or 01234, where 0 means missing data.

	Example

         1      SAMPLE0 0 0 2 2  1 2  3 3  1 1  1 1  3 3  1 1  3 3
         2      SAMPLE1 0 0 1 2  1 2  1 3  1 4  1 1  1 3  1 1  3 3
         3      SAMPLE2 0 0 2 1  1 2  1 1  1 4  1 2  1 3  1 4  3 4
         4      SAMPLE3 0 0 1 1  2 2  1 3  4 4  2 2  1 1  1 4  3 4
         5      SAMPLE4 0 0 2 1  2 2  1 1  1 4  2 2  1 1  1 4  4 4
	"
	
	^ self inputFile
]

{ #category : #accessing }
BioEIGENSTRATWriter >> pedFile: fileReference [
	" Set fileReference to the input PED file "
	
	self inputFile: fileReference
]

{ #category : #private }
BioEIGENSTRATWriter >> preallocateMatrix [
	| rows |
	
	rows := 0.
	self parser 
		select: [ : row | row notEmpty and: [ self includesAlleleFrq: row ] ]
		thenDo: [ : row | rows := rows + 1 ].
	self initMatrixRows: rows columns: 6.	
]

{ #category : #private }
BioEIGENSTRATWriter >> setParserForAlleleFqs [

	self parser: (self parserClass on: (BioObject openFullFileNamed: self alleleFqs)).
	self parser 
		reset;
		separator: $;.
	2 timesRepeat: [ self parser skipHeader ].

]

{ #category : #private }
BioEIGENSTRATWriter >> setParserForPed [

	self parser: (self parserClass on: (BioObject openFullFileNamed: self pedFile)).
	self parser separator: Character tab.
	^ self parser.

]

{ #category : #accessing }
BioEIGENSTRATWriter >> strName [
	^ strName
]

{ #category : #accessing }
BioEIGENSTRATWriter >> strName: anObject [
	strName := anObject
]

{ #category : #accessing }
BioEIGENSTRATWriter >> writeAsEigenStrat [
	" Write the receiver's input files in EigenStrat format "

	self delimiter: Character tab.
	self fillSNPMatrix.
	self exportMatrix.
	
	self outputFile: nil.	
	self delimiter: nil.
	self outputFilename: (self outputFilename copyUpTo: $.) , '.geno'.
	self exportMatrix: self fillGenotypeMatrix.

]
