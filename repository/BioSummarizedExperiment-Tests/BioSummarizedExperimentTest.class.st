Class {
	#name : 'BioSummarizedExperimentTest',
	#superclass : 'TestCase',
	#category : 'BioSummarizedExperiment-Tests',
	#package : 'BioSummarizedExperiment-Tests'
}

{ #category : 'instance creation' }
BioSummarizedExperimentTest >> newTestSE [
	"Create a test SummarizedExperiment with 4 genes x 3 samples."

	| se matrix rowData colData |
	matrix := Array2D rows: 4 columns: 3.
	matrix at: 1 at: 1 put: 10.
	matrix at: 1 at: 2 put: 20.
	matrix at: 1 at: 3 put: 30.
	matrix at: 2 at: 1 put: 15.
	matrix at: 2 at: 2 put: 25.
	matrix at: 2 at: 3 put: 35.
	matrix at: 3 at: 1 put: 5.
	matrix at: 3 at: 2 put: 10.
	matrix at: 3 at: 3 put: 15.
	matrix at: 4 at: 1 put: 8.
	matrix at: 4 at: 2 put: 16.
	matrix at: 4 at: 3 put: 24.
	rowData := DataFrame 
		withRows: #( #( 1 'BRCA1' ) #( 2 'TP53' ) #( 3 'EGFR' ) #( 4 'MYC' ) )
		columnNames: #( 'id' 'gene' ).
	colData := DataFrame
		withRows: #( #( 1 'S1' 'control' ) #( 2 'S2' 'treated' ) #( 3 'S3' 'treated' ) )
		columnNames: #( 'id' 'sample' 'condition' ).
	se := BioSummarizedExperiment
		      assay: matrix
		      rowData: rowData
		      colData: colData.
	^ se
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testAssay [

	| se matrix |
	se := BioSummarizedExperiment new.
	matrix := Array2D rows: 2 columns: 2.
	matrix atRow: 1 put: #( 1 2 ).
	matrix atRow: 2 put: #( 3 4 ).
	se assay: matrix.
	self assert: se assay notNil.
	self deny: se assays isEmpty
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testAssayAtPut [

	| se matrix |
	se := BioSummarizedExperiment new.
	matrix := Array2D rows: 2 columns: 2.
	se assayAt: 'counts' put: matrix.
	se assayAt: 'logcounts' put: matrix.
	self assert: (se assayAt: 'counts') notNil.
	self assert: (se assayAt: 'logcounts') notNil.
	self assert: se assayNames size equals: 2
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testColData [

	| se |
	se := self newTestSE.
	self assert: se colCount equals: 3.
	self assert: (se colData first at: 'condition') equals: 'control'
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testColNames [

	| se names |
	se := self newTestSE.
	names := se colNames.
	self assert: names size equals: 3
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testCreation [

	| se |
	se := BioSummarizedExperiment new.
	self assert: se assays notNil.
	self assertEmpty: se assays.
	self assert: se rowCount equals: 0.
	self assert: se colCount equals: 0
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testDim [

	| se |
	se := self newTestSE.
	self assert: se dim key equals: 4. "rows"
	self assert: se dim value equals: 3 "cols"
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testFactoryMethod [

	| se matrix rowData colData |
	matrix := Array2D rows: 2 columns: 2.
	rowData := DataFrame
		           withRows: #( #( 1 'gene1' ) #( 2 'gene2' ) )
		           columnNames: #( 'id' 'name' ).
	colData := DataFrame
		           withRows: #( #( 1 'sample1' ) #( 2 'sample2' ) )
		           columnNames: #( 'id' 'name' ).
	se := BioSummarizedExperiment
		      assay: matrix
		      rowData: rowData
		      colData: colData.
	self assert: se rowCount equals: 2.
	self assert: se colCount equals: 2
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testMetadata [

	| se |
	se := BioSummarizedExperiment new.
	se metadata at: 'experiment' put: 'RNA-seq'.
	se metadata at: 'date' put: '2024-01-15'.
	self assert: (se metadata at: 'experiment') equals: 'RNA-seq'
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testRowData [

	| se |
	se := self newTestSE.
	self assert: se rowCount equals: 4.
	self assert: (se rowData first at: 'gene') equals: 'BRCA1'
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testRowNames [

	| se names |
	se := self newTestSE.
	names := se rowNames.
	self assert: names size equals: 4
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testSubetByRowIndex [

	| se subset |
	se := self newTestSE.
	subset := se atRowIndex: 1 to: 2.
	self assert: subset rowCount equals: 2.
	self assert: subset colCount equals: 3
]

{ #category : 'tests' }
BioSummarizedExperimentTest >> testSubsetByColIndex [

	| se subset |
	se := self newTestSE.
	subset := se atColIndex: 2 to: 3.
	self assert: subset rowCount equals: 4.
	self assert: subset colCount equals: 2
]
