"
LAMP-LD visualizer for 2 mixing populations.

Usage Examples
==============

BioLAMPLD2WayVisualizer openOnFileNamed: 'results\lampld_ws-50.out'.

BioLAMPLD2WayVisualizer openOnDirectory: 'results'.

BioLAMPLD2WayVisualizer dumpOnDirectory: 'results'.

BioLAMPLD2WayVisualizer openOn: '11:187 00:295 11:494 00:668 11:898 01:1197 00:1485 11:1747 00:2109 11:2274 00:2656 01:3068 11:3258 01:3955 00:4339 11:4444 01:5096 00:5585
 01:1507 11:1759 01:5585
 01:1144 00:1395 01:1541 11:1739 01:2457 00:2517 01:4244 11:4425 01:5585'. 
"
Class {
	#name : #BioLAMPLD2WayVisualizer,
	#superclass : #BioLAMPLDVisualizer,
	#instVars : [
		'population1Color',
		'population1Name',
		'population2Color',
		'population2Name',
		'matrix',
		'populationCount',
		'homozygousRowIndex',
		'heterozygousRowIndex'
	],
	#category : 'BioLAMPLD-Visualization'
}

{ #category : #examples }
BioLAMPLD2WayVisualizer class >> example01 [
	" Read expanded output file and positions file "

	self new
		lineWidth: 0.75;
		posFile: 'positions_mb.pos';
		population1Name: 'Angus' color: Color red;
		population2Name: 'Brahman' color: Color blue;
		readExpanded: 'postlampld_ws-100.txt' title: 'Angus versus Brahman';
		open.
]

{ #category : #private }
BioLAMPLD2WayVisualizer >> configureDataSet: aCollection connectColor: aColor [

	| aDataSet |
	aDataSet := RTData new.
	"aDataSet connectColor: aColor."
	"aDataSet dotShape circle size: 5."
	aDataSet 
		noDot;
		points: aCollection;
		connectUsing: (RTLine new color: aColor; width: self lineWidth);
		x: #position;
		y: #average.
	self grapher add: aDataSet.
]

{ #category : #private }
BioLAMPLD2WayVisualizer >> findAllele2Way: alleleCode [

	^ alleleCode = '11' 
		ifTrue: [ 2 ] 
		ifFalse: [ 
			alleleCode = '01' 
				ifTrue: [ 1 ] 
				ifFalse: [ 0 ] ].
]

{ #category : #private }
BioLAMPLD2WayVisualizer >> findAlleleRefCount [ 

	^ dataPoints collect: [ : a | 
			a first = '11' 
				ifTrue: [ 2 ] 
				ifFalse: [ 
					a first = '01' 
						ifTrue: [ 1 ] 
						ifFalse: [ 0 ] ] ].
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> heterozygousRowIndex [

	^ heterozygousRowIndex

]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> heterozygousRowIndex: anObject [
	heterozygousRowIndex := anObject
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> homozygousRowIndex [

	^ homozygousRowIndex

]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> homozygousRowIndex: anObject [
	homozygousRowIndex := anObject
]

{ #category : #initialization }
BioLAMPLD2WayVisualizer >> initializeDataSets [

	self heterozygousRowIndex: 2.

	self homozygousRowIndex: 1.
	self configureDataSet: self popFrequency connectColor: self population1Color.

	self homozygousRowIndex: 3.	
	self configureDataSet: self popFrequency connectColor: self population2Color.
]

{ #category : #initialization }
BioLAMPLD2WayVisualizer >> initializeGrapher: titleString [
	" See superimplementor's comment "

	self initializeBasicGrapher: titleString.
	self initializeDataSets.
	self initializeTicks.
	self initializeLegends.
	self initializeXAxisLabels.
	^ self grapher

]

{ #category : #initialization }
BioLAMPLD2WayVisualizer >> initializeLegends [

	| lb |
	
	lb := RTLegendBuilder new.
	lb view: self grapher view.
	lb addColor: self population1Color text: self population1Name.
	lb addColor: self population2Color text: self population2Name.
	"lb addColor: Color black text: 'Admixed population'."
	lb right.
	lb build.

]

{ #category : #initialization }
BioLAMPLD2WayVisualizer >> initializeMatrix [

	matrix := DhbMatrix rows: 3 columns: self snpCount.
	matrix atAllPut: 0.
	1 to: self snpCount do: [ : colIndex | 
		dataPoints pairsDo: [ :hapArray1 :hapArray2 | 
			| h1 h2 |
			h1 := hapArray1 at: colIndex.
			h2 := hapArray2 at: colIndex.
			(h1 = $1 and: [ h2 = $1 ])
				ifTrue: [ matrix at: 1 at: colIndex put: (matrix at: 1 at: colIndex) + 1 ]
				ifFalse: [ 
					(h1 = $0 and: [ h2 = $1 ])
						ifTrue: [ matrix at: 2 at: colIndex put: (matrix at: 2 at: colIndex) + 1 ]
						ifFalse: [ 
							(h1 = $0 and: [ h2 = $0 ])
								ifTrue: [ matrix at: 3 at: colIndex put: (matrix at: 3 at: colIndex) + 1 ]
								ifFalse: [ self error: 'Should not happen' ] ] ] ] ].
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> matrix [
	^ matrix
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> matrix: anObject [
	matrix := anObject
]

{ #category : #private }
BioLAMPLD2WayVisualizer >> popFrequency [
	" Answer a <Collection> with allelic frequencies adding to heterozygous "
	
	| popArray snpInterval |
	
	popArray := OrderedCollection new: self matrix numberOfColumns.	
	self snpPositions: (self posFile asFileReference contents lines collect: #asNumber).
	snpInterval := (1 to: self snpCount) asArray.
	self snpPositions with: snpInterval do: [ : pos : index |
		| col avg |
		col := self matrix columnAt: index.
		avg := ((((2 * (col at: self homozygousRowIndex)) + (col at: self heterozygousRowIndex)) / (self populationCount * 2) * 100.0) roundTo: 0.1).
		popArray add: (BioSNPAncestry new
			position: pos;
			average: avg;
			yourself) ].
	^ popArray

]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population1Color [
	^ population1Color
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population1Color: anObject [
	population1Color := anObject
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population1Name [
	^ population1Name
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population1Name: anObject [
	population1Name := anObject
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population1Name: aString color: aColor [

	population1Name := aString.
	population1Color := aColor.

]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population2Color [
	^ population2Color
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population2Color: anObject [
	population2Color := anObject
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population2Name [
	^ population2Name
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population2Name: anObject [
	population2Name := anObject
]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> population2Name: aString color: aColor [

	population2Name := aString.
	population2Color := aColor.

]

{ #category : #accessing }
BioLAMPLD2WayVisualizer >> populationCount [
	" Answer a <Number> representing the count of problem (admixed) pòpulation "
	
	^ populationCount
		ifNil: [ populationCount := self dataPoints size / 2 ]

]
