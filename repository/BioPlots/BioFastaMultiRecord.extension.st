Extension { #name : #BioFastaMultiRecord }

{ #category : #'*BioPlots' }
BioFastaMultiRecord >> groupedBySeqLengthDistribution: aNumber [
	" Answer a <Collection> of <BioFastaRecord> grouped by sequence length "
	
	^ RTDistribution new 
		objects: self records;
		metric: #size;
		frequencyWithAmountOfIntervals: aNumber
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
BioFastaMultiRecord >> plotHistogramBins: binNumber xAxisLabel: axisXLabel yAxisLabel: axixYLabel color: aColor barWidth: barWidth [

	| bins minPoint g ds |
	
	bins := self groupedBySeqLengthDistribution: binNumber.
	minPoint := ((bins reject: #isEmpty) detectMin: [ : c | c size ]) anyOne size - 28.

	" Build diagram "
	g := RTGrapher new 
			extent: 500 @ 200; 
			minX: minPoint;
			withoutOrigin;
			yourself.
	ds := RTData new
		points: bins;
		x: [ : c | c ifEmpty: [ minPoint ] ifNotEmpty: [ : d | d anyOne size ] ];
		y: #size.
	ds barShape 
		borderColor: Color black;
		color: aColor;
		width: barWidth.
	g add: ds.

	" Configure axis settings "
	g axisY 
		title: axixYLabel;
		color: Color black;	
		noDecimal.
	g axisX 
		noDecimal;	
		fromPoint: minPoint;
		color: Color black;
		title: axisXLabel.
		
"    g datasets do: #offsetForBarCharts.
    g minX: 0.
    g maxX: g getMaxNumberOfPoints."
		
	" Open visualization in a new window "
	g open.
]
