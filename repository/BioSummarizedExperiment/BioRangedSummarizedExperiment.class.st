Class {
	#name : 'BioRangedSummarizedExperiment',
	#superclass : 'BioSummarizedExperiment',
	#instVars : [
		'rowRanges'
	],
	#category : 'BioSummarizedExperiment',
	#package : 'BioSummarizedExperiment'
}

{ #category : 'as yet unclassified' }
BioRangedSummarizedExperiment class >> fromRanges: seqnames start: starts end: ends strand: strands assay: matrix colData: colInfo [
	"Create a RangedSummarizedExperiment from arrays of genomic coordinates."

	| rse ir ranges |
	ir := BioIRanges new
		      starts: starts;
		      ends: ends.
	ranges := BioGenomicRanges new
		          ranges: ir;
		          seqnames: seqnames;
		          strands: strands.
	rse := self new
		       assay: matrix;
		       rowRanges: ranges;
		       colData: colInfo;
		       yourself.
	^ rse
]

{ #category : 'as yet unclassified' }
BioRangedSummarizedExperiment class >> pythonExample [
	"Create a SummarizedExperiment matching the Python example.
	 Uses DataFrame for rowData and colData."

	| nrows ncols rse seqnames strands matrix ir ranges colData rowData treatments c1 c2 c3 |
	nrows := 200.
	ncols := 6.
	c1 := String withAll: #( $c $h $r $1 ).
	c2 := String withAll: #( $c $h $r $2 ).
	c3 := String withAll: #( $c $h $r $3 ).
	seqnames := Array new: nrows.
	1 to: nrows do: [ :i |
			| patternIdx chr |
			patternIdx := i - 1 \\ 10 + 1.
			chr := patternIdx <= 2
				       ifTrue: [ c1 ]
				       ifFalse: [
						       patternIdx <= 6
							       ifTrue: [ c2 ]
							       ifFalse: [ c3 ] ].
			seqnames at: i put: chr ].

	strands := Array new: nrows.
	#( $- $+ $+ $* $* $+ $+ $+ $- $- ) withIndexDo: [ :char :idx |
		1 to: 20 do: [ :rep | strands at: idx + (rep - 1 * 10) put: char ] ].

	matrix := Array2D rows: nrows columns: ncols.
	1 to: nrows do: [ :i |
			1 to: ncols do: [ :j |
			matrix at: i at: j put: 100 atRandom asFloat / 100.0 ] ].

	ir := BioIRanges new.
	ir starts: ((1 to: nrows) collect: [ :i | 99 + i ]).
	ir ends: ((1 to: nrows) collect: [ :i | 109 + i ]).
	ranges := BioGenomicRanges new
		          ranges: ir;
		          seqnames: seqnames;
		          strands: strands.

	colData := DataFrame
		           withRows:
		           ((1 to: ncols) collect: [ :i | { (i \\ 2 = 1) } ])
		           columnNames: #( 'treatment' ).
	treatments := (colData column: 'treatment') asArray collect: [ :v |
			              v
				              ifTrue: [ 'ChIP' ]
				              ifFalse: [ 'Input' ] ].
	colData column: 'treatment' put: treatments.

	rowData := DataFrame
		           withRows: ((1 to: nrows) collect: [ :i |
					            {
						            (i - 1).
						            (100 atRandom / 100.0) } ])
		           columnNames: #( 'score' 'GC' ).

	rse := self new
		       assay: matrix;
		       rowRanges: ranges;
		       colData: colData;
		       rowData: rowData.
	^ rse
]

{ #category : 'as yet unclassified' }
BioRangedSummarizedExperiment class >> randomWithRows: nrows cols: ncols seqnames: seqnames start: startOffset end: width strand: strands [
	"Create a RangedSummarizedExperiment with random assay and specified genomic coordinates."

	| matrix ir ranges colData rse |
	matrix := Array2D rows: nrows columns: ncols.
	1 to: nrows do: [ :i |
			1 to: ncols do: [ :j |
			matrix at: i at: j put: 100 atRandom asFloat / 100.0 ] ].
	ir := BioIRanges new.
	ir starts: ((1 to: nrows) collect: [ :i | startOffset + i - 1 ]).
	ir ends:
		((1 to: nrows) collect: [ :i | startOffset + width + i - 2 ]).
	ranges := BioGenomicRanges new
		          ranges: ir;
		          seqnames: seqnames;
		          strands: strands.
	colData := (1 to: ncols) collect: [ :i | Dictionary new ].
	rse := self new
		       assay: matrix;
		       rowRanges: ranges;
		       colData: colData;
		       yourself.
	^ rse
]

{ #category : 'converting' }
BioRangedSummarizedExperiment >> asBioGenomicRanges [
	"Answer rowRanges or nil."

	^ rowRanges
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> byChromosome: seqname [
	"Return a new RangedSummarizedExperiment for one chromosome."

	| indices |
	rowRanges ifNil: [ ^ nil ].
	indices := (1 to: rowRanges size) select: [ :i |
		           (rowRanges seqnames at: i) = seqname ].
	indices ifEmpty: [ ^ nil ].
	^ self atRowIndex: indices first to: indices last
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> end [
	"Answer end positions from rowRanges."

	^ rowRanges ifNil: [ #(  ) ] ifNotNil: [ rowRanges end ]
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> granges [
	"Answer rowRanges as BioGenomicRanges (alias)."

	^ rowRanges
]

{ #category : 'querying' }
BioRangedSummarizedExperiment >> overlaps: seqname from: startPos to: endPos [
	"Find features overlapping a genomic range."

	| queryIR queryRange |
	rowRanges ifNil: [ ^ #(  ) ].
	queryIR := BioIRanges new
		           starts: (Array with: startPos);
		           ends: (Array with: endPos).
	queryRange := BioGenomicRanges new
		              ranges: queryIR;
		              seqnames: (Array with: seqname);
		              strands: (Array with: $+).
	^ rowRanges findOverlaps: queryRange
]

{ #category : 'querying' }
BioRangedSummarizedExperiment >> overlaps: seqname from: startPos to: endPos strand: strandSymbol [
	"Find features overlapping a genomic range on specific strand."

	| queryRange |
	rowRanges ifNil: [ ^ #(  ) ].
	queryRange := BioGenomicRange new
		              seqname: seqname;
		              start: startPos;
		              end: endPos;
		              strand: strandSymbol;
		              yourself.
	^ rowRanges findOverlaps: queryRange
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> rowRanges [
	"Answer the BioGenomicRanges for rows."

	^ rowRanges
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> rowRanges: genomicRanges [
	"Set the genomic ranges for rows."

	rowRanges := genomicRanges
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> seqnames [
	"Answer sequence names from rowRanges."

	^ rowRanges ifNil: [ #(  ) ] ifNotNil: [ rowRanges seqnames ]
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> start [
	"Answer start positions from rowRanges."

	^ rowRanges ifNil: [ #(  ) ] ifNotNil: [ rowRanges start ]
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> strand [
	"Answer strands from rowRanges."

	^ rowRanges ifNil: [ #(  ) ] ifNotNil: [ rowRanges strands ]
]

{ #category : 'querying' }
BioRangedSummarizedExperiment >> subsetByOverlaps: seqname from: startPos to: endPos [
	"Return a new RangedSummarizedExperiment subsetted to overlapping features."

	| indices |
	indices := self overlaps: seqname from: startPos to: endPos.
	indices ifEmpty: [ ^ nil ].
	^ self atRowIndex: indices to: indices last
]

{ #category : 'accessing' }
BioRangedSummarizedExperiment >> width [
	"Answer widths from rowRanges."

	^ rowRanges ifNil: [ #(  ) ] ifNotNil: [ rowRanges width ]
]
