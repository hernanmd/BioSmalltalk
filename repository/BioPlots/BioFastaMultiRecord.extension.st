Extension { #name : #BioFastaMultiRecord }

{ #category : #'*BioPlots' }
BioFastaMultiRecord >> plot [
	" Open a window displaying an historgram of the receiver's sequences.
	X-axis represent the bins with sequence lengths (using the Roassal's default bin length
	Y-axis represent the amount of bases in each bin "

	^ self
		plotHistogramBins: 20 
		xAxisLabel: 'Sequence lengths (bp)'
		yAxisLabel: 'Sequence Count'.
]

{ #category : #'*BioPlots' }
BioFastaMultiRecord >> plotGcSkewInt [
	"Plot the receiver's sequences GC skew"

	| sequenceCharts canvas |
	
	canvas := RSCanvas new.
	sequenceCharts := self sequences collect: [ : sequence |  sequence chartGcSkewInt asShape ].
	canvas addAll: sequenceCharts.
	RSGridLayout on: canvas shapes.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #'*BioPlots' }
BioFastaMultiRecord >> plotHistogramBins: binNumber xAxisLabel: axisXLabel yAxisLabel: axixYLabel [

	| chart plot |
	
	plot := RSHistogramPlot new 
		x: (self records collect: #size);
		yourself.
	chart := RSCompositeChart new
	   title: ('Histogram of {1} FASTA sequences' format: { self size asString });
		"colors: (RSColorPalette sequential perform: colorPaletteSelector);"
		ylabel: axixYLabel;
		xlabel: axisXLabel;
		add: plot;
		yourself.
	chart horizontalTick integer.
	chart open.
]

{ #category : #'*BioPlots' }
BioFastaMultiRecord >> plotHistogramBins: binNumber xAxisLabel: axisXLabel yAxisLabel: axixYLabel color: aColor [

	self 
		plotHistogramBins: binNumber 
		xAxisLabel: axisXLabel 
		yAxisLabel: axixYLabel 
		color: aColor
		barWidth: 25
]

{ #category : #'*BioPlots' }
BioFastaMultiRecord >> plotHistogramBins: binNumber xAxisLabel: axisXLabel yAxisLabel: axixYLabel color: colorPaletteSelector barWidth: barWidth [

	| c plot |
	
	plot := RSHistogramPlot new 
		x: (self records collect: #size);
		yourself.
	c := RSCompositeChart new
	   title: ('Histogram of {1} FASTA sequences' format: { self size asString });
		"colors: (RSColorPalette sequential perform: colorPaletteSelector);"
		ylabel: axixYLabel;
		xlabel: axisXLabel;
		add: plot;
		addDecoration: RSVerticalTick new;
		addDecoration: RSHorizontalTick new doNotUseNiceLabel;
		open.
]
