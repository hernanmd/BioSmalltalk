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
BioFastaMultiRecord >> plotHistogramBins: binNumber xAxisLabel: axisXLabel yAxisLabel: axixYLabel [

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
	c := RSChart new
	   title: ('Histogram of {1} FASTA sequences' format: { self size asString });
		"colors: (RSColorPalette sequential perform: colorPaletteSelector);"
		ylabel: axixYLabel;
		xlabel: axisXLabel;
		addPlot: plot;
		addDecoration: RSVerticalTick new;
		addDecoration: RSHorizontalTick new doNotUseNiceLabel;
		open.
]
