Class {
	#name : 'BioRangedSummarizedExperimentTest',
	#superclass : 'TestCase',
	#category : 'BioSummarizedExperiment-Tests',
	#package : 'BioSummarizedExperiment-Tests'
}

{ #category : 'instance creation' }
BioRangedSummarizedExperimentTest >> newTestRSE [
	"Create a test RangedSummarizedExperiment with DataFrame."

	| matrix rowData colData ranges |
	matrix := Array2D rows: 3 columns: 2.
	matrix at: 1 at: 1 put: 100.
	matrix at: 1 at: 2 put: 150.
	matrix at: 2 at: 1 put: 200.
	matrix at: 2 at: 2 put: 250.
	matrix at: 3 at: 1 put: 50.
	matrix at: 3 at: 2 put: 75.
	rowData := DataFrame
		           withRows: #( #( 1 'BRCA1' ) #( 2 'TP53' ) #( 3 'EGFR' ) )
		           columnNames: #( 'id' 'gene' ).
	colData := DataFrame
		           withRows: #( #( 1 'S1' ) #( 2 'S2' ) )
		           columnNames: #( 'id' 'sample' ).
	ranges := BioGenomicRanges new
		          ranges: (BioIRanges starts: #( 1000 3000 5000 ) ends: #( 2000 4000 6000 ));
		          seqnames: { 'chr1' . 'chr2' . 'chr3' };
		          strands: #( $+ $- $+ ).
	^ BioRangedSummarizedExperiment new
		assay: matrix;
		rowRanges: ranges;
		rowData: rowData;
		colData: colData;
		yourself
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testByChromosome [

	| rse chr1 |
	rse := self newTestRSE.
	chr1 := rse byChromosome: 'chr1'.
	self assert: chr1 notNil
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testCreation [

	| rse |
	rse := BioRangedSummarizedExperiment new.
	self assert: rse assays notNil.
	self assert: rse rowRanges isNil
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testGranges [

	| rse gr |
	rse := self newTestRSE.
	gr := rse granges.
	self assert: gr notNil.
	self assert: gr size equals: 3
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testInheritsFromSummarizedExperiment [

	| rse |
	rse := BioRangedSummarizedExperiment new.
	self assert: (rse isKindOf: BioSummarizedExperiment)
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testOverlaps [

	| rse overlaps |
	rse := self newTestRSE.
	overlaps := rse overlaps: 'chr1' from: 1500 to: 2500.
	self assert: overlaps notNil
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testPythonExampleSize [

	| rse |
	rse := BioRangedSummarizedExperiment new.
	self assert: rse dim key equals: 0.
	self assert: rse dim value equals: 0
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testRowRanges [

	| rse ranges |
	rse := self newTestRSE.
	ranges := rse rowRanges.
	self assert: ranges notNil.
	self assert: ranges size equals: 3
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testSeqnames [

	| rse seqs |
	rse := self newTestRSE.
	seqs := rse seqnames.
	self assert: seqs size equals: 3
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testStartEndWidth [

	| rse |
	rse := self newTestRSE.
	self assert: rse start size equals: 3.
	self assert: rse end size equals: 3.
	self assert: rse width size equals: 3
]

{ #category : 'tests' }
BioRangedSummarizedExperimentTest >> testStrand [

	| rse strands |
	rse := self newTestRSE.
	strands := rse strand.
	self assert: strands size equals: 3
]
