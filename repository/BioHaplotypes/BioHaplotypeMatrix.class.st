Class {
	#name : 'BioHaplotypeMatrix',
	#superclass : 'Object',
	#instVars : [
		'matrix',
		'variantNames',
		'haplotypeNames',
		'metadata'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotypeMatrix class >> fromHaplotypes: aBioHaplotypes [

	^ aBioHaplotypes asHaplotypeMatrix
]

{ #category : 'instance creation' }
BioHaplotypeMatrix class >> rows: rowCount cols: colCount [

	^ self new
		  matrix: (Array2D rows: rowCount columns: colCount);
		  yourself
]

{ #category : 'statistics' }
BioHaplotypeMatrix >> alleleStringAtRow: anIndex [

	^ String streamContents: [ :s |
			  1 to: self columns do: [ :j |
					  j > 1 
						ifTrue: [ s nextPut: $- ].
					  s nextPutAll: (matrix at: anIndex at: j) ] ]
]

{ #category : 'converting' }
BioHaplotypeMatrix >> asArray2D [

	^ matrix
]

{ #category : 'converting' }
BioHaplotypeMatrix >> asDataFrame [
	"Convert to DataFrame. Requires DataFrame package."

	| df rowNames colNames |
	rowNames := haplotypeNames ifNil: [
		            (1 to: self rows) collect: [ :i | 'H' , i printString ] ].
	colNames := variantNames ifNil: [
		            (1 to: self columns) collect: [ :j |
			            'V' , j printString ] ].
	df := DataFrame withColumnNames: colNames.
	1 to: self rows do: [ :i | df addRow: (self rowAt: i) ].
	df rowNames: rowNames.
	^ df
]

{ #category : 'converting' }
BioHaplotypeMatrix >> asPMMatrix [

	^ PMMatrix rows: matrix rows
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> at: row at: col [

	^ matrix at: row at: col
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> at: row at: col put: aValue [

	matrix at: row at: col put: aValue
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> columnAt: anIndex [

	^ (1 to: matrix rowCount) collect: [ :i | matrix at: i at: anIndex ]
]

{ #category : 'statistics' }
BioHaplotypeMatrix >> columnFrequencies [

	^ (1 to: self columns) collect: [ :j |
			  | col counts |
			  col := self columnAt: j.
			  counts := Bag new.
			  counts addAll: (col collect: [ :a | a ]).
			  counts valuesAndCounts associations asDictionary ]
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> columns [

	^ matrix columnCount
]

{ #category : 'gt-views' }
BioHaplotypeMatrix >> gtMatrixFor: aView [

	<gtView>
	| colNames |
	colNames := variantNames ifNil: [
		            (1 to: self columns) collect: [ :i |
			            'V' , i printString ] ].
	^ aView columnedList
		  title: 'Matrix';
		  priority: 1;
		  items: [ (1 to: self rows) collect: [ :i | i -> (self rowAt: i) ] ];
		  column: 'Row' text: [ :assoc | assoc key ];
		  columns: [
				  | cols |
				  cols := OrderedCollection new.
				  1 to: self columns do: [ :j |
							  cols add: (aView column
										   title: (colNames at: j ifAbsent: [ 'V' , j printString ]);
										   text: [ :assoc | assoc value at: j ifAbsent: [ '' ] ]) ].
				  cols ];
		  yourself
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> haplotypeNames [

	^ haplotypeNames ifNil: [ haplotypeNames := Array new ]
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> haplotypeNames: anArray [

	haplotypeNames := anArray
]

{ #category : 'statistics' }
BioHaplotypeMatrix >> haplotypeStrings [

	^ (1 to: self rows) collect: [ :i | self alleleStringAtRow: i ]
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> matrix [

	^ matrix
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> matrix: anArray2D [

	matrix := anArray2D
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'statistics' }
BioHaplotypeMatrix >> pairwiseHammingDistances [
	"Compute pairwise Hamming distances using String>>#hammingDistanceTo:."

	| n dist strings |
	n := self rows.
	strings := self haplotypeStrings.
	dist := Array2D rows: n columns: n.
	1 to: n do: [ :i |
			1 to: n do: [ :j |
					dist
						at: i
						at: j
						put: ((strings at: i) hammingDistanceTo: (strings at: j)) ] ].
	^ dist
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> rowAt: anIndex [

	^ (1 to: matrix columnCount) collect: [ :j |
		  matrix at: anIndex at: j ]
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> rows [

	^ matrix rowCount
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> variantNames [

	^ variantNames ifNil: [ variantNames := Array new ]
]

{ #category : 'accessing' }
BioHaplotypeMatrix >> variantNames: anArray [

	variantNames := anArray
]
