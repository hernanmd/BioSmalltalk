Class {
	#name : 'BioSummarizedExperiment',
	#superclass : 'Object',
	#instVars : [
		'assays',
		'rowData',
		'colData',
		'metadata',
		'assayNames'
	],
	#category : 'BioSummarizedExperiment',
	#package : 'BioSummarizedExperiment'
}

{ #category : 'as yet unclassified' }
BioSummarizedExperiment class >> assay: aMatrix rowData: aDf colData: anotherDf [
	"Create a new SummarizedExperiment with given assay and metadata."

	| se |
	se := self new.
	se assay: aMatrix.
	se rowData: aDf.
	se colData: anotherDf.
	^ se
]

{ #category : 'as yet unclassified' }
BioSummarizedExperiment class >> fromDataFrame: rowDataDf colDataFrame: colDataDf assay: aMatrix [
	"Create a SummarizedExperiment from DataFrames for row and column metadata."

	| se |
	se := self new.
	se assay: aMatrix.
	se rowData: rowDataDf.
	se colData: colDataDf.
	^ se
]

{ #category : 'as yet unclassified' }
BioSummarizedExperiment class >> new [

	^ super new initialize
]

{ #category : 'as yet unclassified' }
BioSummarizedExperiment class >> randomWithRows: nrows cols: ncols [
	"Create a SummarizedExperiment with random assay data."

	| se matrix |
	matrix := Array2D rows: nrows columns: ncols.
	1 to: nrows do: [ :i |
			1 to: ncols do: [ :j |
			matrix at: i at: j put: 100 atRandom asFloat / 100.0 ] ].
	se := self new.
	se assay: matrix.
	^ se
]

{ #category : 'adding' }
BioSummarizedExperiment >> addRowMetadata: key at: index put: value [
	"Add a metadata value to rowData at index."

	| row |
	row := rowData at: index ifAbsentPut: [ Dictionary new ].
	row at: key put: value
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assay [

	self assayNames ifEmpty: [ ^ nil ].
	^ self assayAt: self assayNames first
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assay: matrix [

	assayNames ifEmpty: [ assayNames add: 'counts' ].
	^ self assayAt: assayNames first put: matrix
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assayAt: name [

	^ assays at: name
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assayAt: name put: matrix [

	(assayNames includes: name) ifFalse: [ assayNames add: name ].
	^ assays at: name put: matrix
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assayNames [

	^ assayNames ifNil: [ assays keys ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assays [

	^ assays
]

{ #category : 'accessing' }
BioSummarizedExperiment >> assays: aDictionary [

	assays := aDictionary
]

{ #category : 'accessing' }
BioSummarizedExperiment >> atColIndex: index [

	| newSE |
	newSE := self class new.
	newSE assays: (assays associationsCollect: [ :assoc |
			 assoc key -> (assoc value collect: [ :row | row at: index ]) ]).
	newSE rowData: rowData copy.
	newSE colData: (colData at: index ifAbsent: [ nil ]).
	newSE metadata: metadata copy.
	^ newSE
]

{ #category : 'accessing' }
BioSummarizedExperiment >> atColIndex: start to: end [
	"Answer a new SummarizedExperiment subsetted by column range."

	| newSE newAssays |
	newSE := self class new.
	newAssays := Dictionary new.
	assays keysAndValuesDo: [ :key :matrix |
			| subMatrix |
			subMatrix := Array2D
				             rows: matrix numberOfRows
				             columns: end - start + 1.
			1 to: matrix numberOfRows do: [ :i |
					| colIdx |
					1 to: end - start + 1 do: [ :j |
							colIdx := start + j - 1.
							subMatrix at: i at: j put: (matrix at: i at: colIdx) ] ].
			newAssays at: key put: subMatrix ].
	newSE assays: newAssays.
	newSE rowData: rowData copy.
	newSE colData: (colData rowsFrom: start to: end).
	newSE metadata: metadata copy.
	^ newSE
]

{ #category : 'accessing' }
BioSummarizedExperiment >> atRowIndex: index [

	| newSE |
	newSE := self class new.
	newSE assays: (assays associationsCollect: [ :assoc |
			 assoc key -> (assoc value at: index) ]).
	newSE rowData: (rowData at: index ifAbsent: [ nil ]).
	newSE colData: colData copy.
	newSE metadata: metadata copy.
	^ newSE
]

{ #category : 'accessing' }
BioSummarizedExperiment >> atRowIndex: start to: end [
	"Answer a new SummarizedExperiment subsetted by row range."

	| newSE newAssays |
	newSE := self class new.
	newAssays := Dictionary new.
	assays keysAndValuesDo: [ :key :matrix |
			| subMatrix |
			subMatrix := Array2D
				             rows: end - start + 1
				             columns: matrix numberOfColumns.
			1 to: end - start + 1 do: [ :i |
					| rowIdx |
					rowIdx := start + i - 1.
					1 to: matrix numberOfColumns do: [ :j |
					subMatrix at: i at: j put: (matrix at: rowIdx at: j) ] ].
			newAssays at: key put: subMatrix ].
	newSE assays: newAssays.
	newSE rowData: (rowData rowsFrom: start to: end).
	newSE colData: colData copy.
	newSE metadata: metadata copy.
	^ newSE
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colColumn: columnName [
	"Answer a column from colData. Handles both DataFrame and collection of Dictionary."

	(colData isKindOf: DataFrame) 
		ifTrue: [ ^ colData column: columnName ].
	^ colData collect: [ :row | row at: columnName ifAbsent: [ nil ] ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colCount [
	"Answer the number of columns (samples)."

	^ colData ifNil: [ 0 ] ifNotNil: [ :df | df numberOfRows ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colData [

	^ colData
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colData: aCollection [

	colData := aCollection
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colMeans [
	"Answer array of column means from primary assay."

	| sums |
	sums := self colSums.
	^ sums collect: [ :s | s / self rowCount asFloat ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colNames [
	"Answer column names from colData."

	^ colData rowNames
]

{ #category : 'accessing' }
BioSummarizedExperiment >> colSums [
	"Answer array of column sums from primary assay."

	| matrix sums |
	matrix := self assay.
	sums := Array new: self colCount.
	1 to: self colCount do: [ :j |
			| sum |
			sum := 0.
			1 to: self rowCount do: [ :i | sum := sum + (matrix at: i at: j) ].
			sums at: j put: sum ].
	^ sums
]

{ #category : 'accessing' }
BioSummarizedExperiment >> dim [

	^ self rowCount -> self colCount
]

{ #category : 'initialization' }
BioSummarizedExperiment >> initialize [

	super initialize.
	assays := Dictionary new.
	assayNames := OrderedCollection new.
	rowData := DataFrame new.
	colData := DataFrame new.
	metadata := Dictionary new
]

{ #category : 'accessing' }
BioSummarizedExperiment >> metadata [

	^ metadata
]

{ #category : 'accessing' }
BioSummarizedExperiment >> metadata: aDictionary [

	metadata := aDictionary
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowColumn: columnName [
	"Answer a column from rowData. Handles both DataFrame and collection of Dictionary."

	(rowData isKindOf: DataFrame) 
		ifTrue: [ ^ rowData column: columnName ].
	^ rowData collect: [ :row | row at: columnName ifAbsent: [ nil ] ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowCount [
	"Answer the number of rows (features)."

	^ rowData ifNil: [ 0 ] ifNotNil: [ :df | df numberOfRows ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowData [

	^ rowData
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowData: aCollection [

	rowData := aCollection
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowMeans [
	"Answer array of row means from primary assay."

	| sums |
	sums := self rowSums.
	^ sums collect: [ :s | s / self colCount asFloat ]
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowNames [
	"Answer row names from rowData."

	^ rowData rowNames
]

{ #category : 'accessing' }
BioSummarizedExperiment >> rowSums [
	"Answer array of row sums from primary assay."

	| matrix sums |
	matrix := self assay.
	sums := Array new: self rowCount.
	1 to: self rowCount do: [ :i |
			| sum |
			sum := 0.
			1 to: self colCount do: [ :j | sum := sum + (matrix at: i at: j) ].
			sums at: i put: sum ].
	^ sums
]

{ #category : 'initialization' }
BioSummarizedExperiment >> setColMetadata: key to: values [
	"Set a metadata column for all columns. Works with both DataFrame and collection."

	(colData isKindOf: DataFrame) ifTrue: [
			colData addColumn: values named: key.
			^ self ].
	values withIndexDo: [ :val :i | (colData at: i) at: key put: val ]
]

{ #category : 'initialization' }
BioSummarizedExperiment >> setRowMetadata: key to: values [
	"Set a metadata column for all rows. Works with both DataFrame and collection."

	(rowData isKindOf: DataFrame) ifTrue: [
			rowData addColumn: values named: key.
			^ self ].
	values withIndexDo: [ :val :i | (rowData at: i) at: key put: val ]
]

{ #category : 'printing' }
BioSummarizedExperiment >> summary [
	"Answer a summary description."

	^ String streamContents: [ :s |
			  s
				  nextPutAll: 'class: ';
				  print: self class name;
				  cr.
			  s
				  nextPutAll: 'dim: ';
				  print: self dim;
				  cr.
			  s
				  nextPutAll: 'assays: ';
				  print: self assayNames asArray;
				  cr.
			  (rowData isKindOf: DataFrame)
				  ifTrue: [
						  s
							  nextPutAll: 'rowData columns: ';
							  print: rowData columnNames asArray;
							  cr ]
				  ifFalse: [
						  s
							  nextPutAll: 'rowData size: ';
							  print: rowData size;
							  cr ].
			  (colData isKindOf: DataFrame)
				  ifTrue: [
						  s
							  nextPutAll: 'colData columns: ';
							  print: colData columnNames asArray ]
				  ifFalse: [
						  s
							  nextPutAll: 'colData size: ';
							  print: colData size ] ]
]
