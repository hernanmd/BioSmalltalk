"
Abstract class for visualization of LAMP-LD data. It uses the Roassal visualization engine.
See subclasses for specific implementations depending on the number of parental populations.

In short, the visualizer can read two output file formats :

- The ""compact"" format output from unolanc, unolanc2way and unolanc5way.
- The ""expanded"" format output from convertLAMPLDOut.pl Perl script.


    Instance Variables
	data:			<String >
	dataPoints:		<Collection>
	dataSet:			<Collection>
	grapher:			<RTGrapher>


"
Class {
	#name : #BioLAMPLDVisualizer,
	#superclass : #BioNamedObject,
	#instVars : [
		'dataPoints',
		'grapher',
		'dataSet',
		'extent',
		'axisXTitle',
		'axisYTitle',
		'parsedDataPoints',
		'graphers',
		'numberOfXLabels',
		'numberOfYTicks',
		'numberOfXTicks',
		'lineWidth',
		'posFile',
		'gapSize',
		'contents',
		'snpCount',
		'snpPositions'
	],
	#category : 'BioLAMPLD-Visualization'
}

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> dumpFromCompactDirectoryNamed: aString [
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "
	
	^ aString asFileReference entries 
		collect: [ : fname | self openOnCompactFileNamed: fname fullName positionsFile: (self findPositionsFileIn: aString) ]
		thenDo: [ : v |
				RTPNGExporter new 
					builder: v grapher view view;
					fileName: v name , '.png';
					exportToFile. ]
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> dumpFromExpandedDirectoryNamed: aString [
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "
	
	^ aString asFileReference entries 
		collect: [ : fname | self openOnExpandedFileNamed: fname fullName positionsFile: (self findPositionsFileIn: aString) ]
		thenDo: [ : v |
				RTPNGExporter new 
					builder: v grapher view view;
					fileName: v name , '.png';
					exportToFile. ]
]

{ #category : #private }
BioLAMPLDVisualizer class >> findPositionsFileIn: aDirectory [
	" Answer a <String> with the file name of the positions file (.pos). If none found, raise an Error "

	^ (aDirectory asFileReference allChildrenMatching: '*.pos')
		ifEmpty: [ self	error: 'No positions file (.pos) were found in the directory : ' , aDirectory ]
		ifNotEmpty: [ :found | found ]
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> openOnCompactFileNamed: outFilename positionsFile: posFilename [
	" Open the receiver using outFilename in compact format as input "

	^ self new 
		initialize: outFilename;
		posFile: posFilename;
		open;
		yourself
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> openOnCompactFileNamed: outFilename positionsFile: posFilename title: aString [
	" Open the receiver using outFilename as input and set aString as visualization legend title "

	^ self new 
		initialize: outFilename;
		posFile: posFilename;
		name: aString;
		open;
		yourself
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> openOnDirectory: aString [
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "

	^ [  : job | 
		| index |
		index := 0.
		job title: 'Starting.'.
		aString asFileReference entries
			collect: [ :fileEntry | self openOnCompactFileNamed: fileEntry fullName positionsFile: (self findPositionsFileIn: aString) title: fileEntry fullName ]
			thenDo: [ : fileEntry | 
				index := index + 1.
				job
					progress: 0.1 * index;
					title: 'Procesing.' , index asString ] ] asJob run
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> openOnDirectory: aString action: aBlock [
	" Create a visualization for each file contained in aString. All files must be in LAMP-LD output format "

	^ [  : job | 
		| index |
		index := 0.
		job title: 'Starting.'.
		aString asFileReference entries
			collect: aBlock
			thenDo: [ : fileEntry | 
				index := index + 1.
				job
					progress: 0.1 * index;
					title: 'Procesing.' , index asString ] ] asJob run
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> openOnExpandedFileNamed: expandedFilename positionsFile: posFilename [
	" Open the receiver using expandedFilename as input. The expanded file is the result of applying the convertLAMPLDout.pl script  "

	^ self new 
		posFile: posFilename;	
		readExpanded: expandedFilename;
		open;
		yourself
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer class >> openOnExpandedFileNamed: expandedFilename positionsFile: posFilename title: aString [
	" Open the receiver using expandedFilename as input. The expanded file is the result of applying the convertLAMPLDout.pl script  "

	^ self new 
		posFile: posFilename;	
		readExpanded: expandedFilename title: aString;
		open;
		yourself
]

{ #category : #accessing }
BioLAMPLDVisualizer >> addGenomicRangeAboveXFrom: start to: end label: labelString [

	self assert: [ Smalltalk hasClassNamed: #RTRangeAboveXAxis  ] description: 'Class must be available'.
	self 
		addGenomicRangeFrom: start 
		to: end 
		label: labelString 
		rangeClass: (Smalltalk at: #RTRangeAboveXAxis)

]

{ #category : #accessing }
BioLAMPLDVisualizer >> addGenomicRangeBelowXFrom: start to: end label: labelString [

	self assert: [ Smalltalk hasClassNamed: #RTRangeBelowXAxis  ] description: 'Class must be available'.
	self 
		addGenomicRangeFrom: start 
		to: end 
		label: labelString 
		rangeClass: (Smalltalk at: #RTRangeBelowXAxis)

]

{ #category : #accessing }
BioLAMPLDVisualizer >> addGenomicRangeFrom: start to: end label: labelString rangeClass: aRTRangeClass [
	" Add a genomic range to the receiver. The start and end positions <Number> must match the bases format choosen for the positions file "
	
	self grapher addDecorator: (
		aRTRangeClass new 
			startValue: start; 
			endValue: end; 
			label: labelString).
]

{ #category : #initialization }
BioLAMPLDVisualizer >> addGrapher: aString [ 
	" Configure and add all graphers from aString data "

	self graphers addAll: (self configureGraphers: aString)
]

{ #category : #accessing }
BioLAMPLDVisualizer >> addGrapher: aString named: title [

	self graphers add: (self initializeGrapher: title)
]

{ #category : #accessing }
BioLAMPLDVisualizer >> addThresholdAt: axisYNumber [
	" Add a horizontal line at axisYNumber, representing a threshold, to the receiver "

	self shouldBeImplemented 
]

{ #category : #accessing }
BioLAMPLDVisualizer >> axisXTitle [
	^ axisXTitle
		ifNil: [ axisXTitle := self defaultAxisXTitle ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> axisYTitle [
	^ axisYTitle
		ifNil: [ axisYTitle := self defaultAxisYTitle ]
]

{ #category : #initialization }
BioLAMPLDVisualizer >> configureDataSet [

	dataSet := RTData new.
	dataSet dotShape color: Color blue.
	dataSet connectUsing: ((RTMultiLine new withVerticallAttachPoint; orthoHorizontal)
		color: (Color blue);
		width: 1;
		withHorizontalAttachPoint; 
		yourself).
	dataSet 
		points: parsedDataPoints;
		x: #x;
		y: #y.
	^ dataSet
]

{ #category : #initialization }
BioLAMPLDVisualizer >> configureGraphers: aString [ 

	^ (self findDataPoints: aString lines) collect: [ : admixDataPoints |
			dataPoints := admixDataPoints.
			parsedDataPoints := self findBreakpoints 
				with: self findAlleleRefCount 
				collect: [ : bp : ac | bp @ ac ].
			self initializeGrapher ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> dataPoints [
	^ dataPoints
]

{ #category : #accessing }
BioLAMPLDVisualizer >> dataPoints: anObject [
	dataPoints := anObject
]

{ #category : #defaults }
BioLAMPLDVisualizer >> defaultAxisXTitle [
	
	^ 'Chr position in Mb'
]

{ #category : #defaults }
BioLAMPLDVisualizer >> defaultAxisYTitle [
	" Answer a default <String> for Y axis "

	^ 'Haplotype %'
]

{ #category : #defaults }
BioLAMPLDVisualizer >> defaultExtent [
	^ 850 @ 400.
]

{ #category : #defaults }
BioLAMPLDVisualizer >> defaultGapSize [
	" Private - See comment in #gapSize "
	
	^ 25
]

{ #category : #printing }
BioLAMPLDVisualizer >> dumpFromExpandedDirectory: aString [
	" Create a stacked visualization for each file contained in aString. All files must be in LAMP-LD output format "

	| fileEntries |
	
	fileEntries := aString asFileReference entries.
	(fileEntries select: [ : fileEntry | self possibleExpandedExtensions includes: fileEntry extension ])
		collect: [ : fileEntry |  
			self copy
				name: 'plot_' , fileEntry basename;
				readExpanded: fileEntry fullName; 
				yourself ]
		thenDo: [ : v | 
			v grapher inspect.
			self halt.
			RTPNGExporter new 
				builder: v grapher view;
				fileName: v name , '.png';
				exportToFile. ]

	
]

{ #category : #accessing }
BioLAMPLDVisualizer >> extent [

	^ extent
		ifNil: [ extent := self defaultExtent ]
]

{ #category : #private }
BioLAMPLDVisualizer >> findBreakpoints [

	^ (self dataPoints collect: #second) collect: #asNumber.

]

{ #category : #private }
BioLAMPLDVisualizer >> findDataPoints: aCollection [
	" Parse and answer a <Collection> of from aCollection in the LAMP-LD output format : '11:85 00:301 01:493' ."

	| admixedDataPoints |
	admixedDataPoints := OrderedCollection new: aCollection size.
	1 to: aCollection size do: [ :index | 
		| admixedIndividual |
		admixedIndividual := aCollection at: index.
		admixedDataPoints
			add:
				((admixedIndividual substrings: ' ')
					collect: [ :dp | dp substrings: ':' ]) ].
	^ admixedDataPoints
]

{ #category : #accessing }
BioLAMPLDVisualizer >> gapSize [
	" Answer a <Number> of points between graphers in stacked visualization view "

	^ gapSize
		ifNil: [ gapSize := self defaultGapSize ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> gapSize: anObject [
	gapSize := anObject
]

{ #category : #accessing }
BioLAMPLDVisualizer >> grapher [
	^ grapher
]

{ #category : #accessing }
BioLAMPLDVisualizer >> grapher: anObject [
	grapher := anObject
]

{ #category : #accessing }
BioLAMPLDVisualizer >> graphers [
	^ graphers
		ifNil: [ graphers := OrderedCollection new ]
]

{ #category : #initialization }
BioLAMPLDVisualizer >> initialize: aFilename [
	" Private - Initialize the receiver's data "

	self name: aFilename.
	self addGrapher: aFilename asFileReference contents.
]

{ #category : #initialization }
BioLAMPLDVisualizer >> initializeBasicGrapher: titleString [
	" See superimplementor's comment "

	self grapher: RTGrapher new.
	self grapher 
		extent: self extent;
		title: titleString.
]

{ #category : #initialization }
BioLAMPLDVisualizer >> initializeGrapher [
	" Answer a new grapher for the receiver's data values "

	self grapher: RTGrapher new.
	self grapher extent: self extent. 
	self grapher add: self configureDataSet.
	self grapher axisX title: self axisXTitle. 
	self grapher axisY title: self axisYTitle.
	^ self grapher

]

{ #category : #initialization }
BioLAMPLDVisualizer >> initializeMatrix [
	" Private - Initialize populations matrix "
	
	self subclassResponsibility 
]

{ #category : #initialization }
BioLAMPLDVisualizer >> initializeTicks [

	self grapher axisX 
		title: self axisXTitle;
"		titlePosition: (500 @ 0)."
		numberOfTicks: self numberOfXTicks;
		numberOfLabels: self numberOfXLabels.
	self grapher
		minX: self snpPositions first;
		withoutOrigin.
	self grapher axisY 
		color: Color black;
		title: self axisYTitle;
		numberOfTicks: self numberOfYTicks;
		noDecimal

]

{ #category : #accessing }
BioLAMPLDVisualizer >> initializeXAxisLabels [

	self grapher axisX 
		color: Color black;
		labelConversion: #asIntegerStringWithCommas
]

{ #category : #accessing }
BioLAMPLDVisualizer >> lineWidth [
	^ lineWidth
		ifNil: [ lineWidth := 1 ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> lineWidth: anObject [
	lineWidth := anObject
]

{ #category : #accessing }
BioLAMPLDVisualizer >> numberOfXLabels [

	^ numberOfXLabels
		ifNil: [ numberOfXLabels := 8 ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> numberOfXLabels: anObject [
	numberOfXLabels := anObject
]

{ #category : #accessing }
BioLAMPLDVisualizer >> numberOfXTicks [

	^ numberOfXTicks
		ifNil: [ numberOfXTicks := 8 ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> numberOfXTicks: anObject [
	numberOfXTicks := anObject
]

{ #category : #accessing }
BioLAMPLDVisualizer >> numberOfYTicks [

	^ numberOfYTicks
		ifNil: [ numberOfYTicks := 9 ]
]

{ #category : #accessing }
BioLAMPLDVisualizer >> numberOfYTicks: anObject [
	numberOfYTicks := anObject
]

{ #category : #opening }
BioLAMPLDVisualizer >> open [
	" Open the receiver's window "

	^ self grapher inspect
]

{ #category : #opening }
BioLAMPLDVisualizer >> openStacked [
	" Open the receiver's window with several graphers stacked between each other "

	self openStacked: self gapSize.

]

{ #category : #opening }
BioLAMPLDVisualizer >> openStacked: aGapSize [
	" Open the receiver's window with gapSize <Number> between each grapher "

	| c |
	c := RTComposer new.
	self graphers keysAndValuesDo: [ : index : g | 
		g view: c view.
		g build.
		c group: index asString ].
	c layout: (RTVerticalLineLayout new gapSize: aGapSize).	
	self graphers keysAndValuesDo: [ : index : g | 
		c
			 nameGroup: index asString 
			as: g title ].
	c view inspect.

]

{ #category : #accessing }
BioLAMPLDVisualizer >> posFile [
	^ posFile
]

{ #category : #accessing }
BioLAMPLDVisualizer >> posFile: anObject [
	posFile := anObject
]

{ #category : #accessing }
BioLAMPLDVisualizer >> possibleExpandedExtensions [
	" Answer a <Collection> of <String> each one representing a file extension for expanded output format "
	
	^ #('out' 'txt')
]

{ #category : #printing }
BioLAMPLDVisualizer >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	aStream 
		space;
		nextPutAll: self name between: $( and: $).
]

{ #category : #initialization }
BioLAMPLDVisualizer >> readExpanded: aFilename [
	" Private - Read expanded output file from LAMP-LD. Use aFilename as title "

	self readExpanded: aFilename title: aFilename.
	
]

{ #category : #initialization }
BioLAMPLDVisualizer >> readExpanded: aFilename title: aString [
	" Private - Read expanded output file from LAMP-LD. Use aString as title "

	contents := aFilename asFileReference contents.
	self dataPoints: contents lines.	
	self snpCount: self dataPoints first size.
	self initializeMatrix.
	self addGrapher: contents named: aString.
]

{ #category : #'instance creation' }
BioLAMPLDVisualizer >> readExpandedDirectory: aString [
	" Create a stacked visualization for each file contained in aString. All files must be in LAMP-LD output format "

	aString asFileReference entries
		collect: [ :fileEntry |  self readExpanded: fileEntry fullName; yourself ].

	
]

{ #category : #accessing }
BioLAMPLDVisualizer >> snpCount [
	^ snpCount
]

{ #category : #accessing }
BioLAMPLDVisualizer >> snpCount: aNumber [
	" Set the receiver's count of SNPs to be aNumber "

	snpCount := aNumber
]

{ #category : #accessing }
BioLAMPLDVisualizer >> snpPositions [
	^ snpPositions
]

{ #category : #accessing }
BioLAMPLDVisualizer >> snpPositions: anObject [
	snpPositions := anObject
]
