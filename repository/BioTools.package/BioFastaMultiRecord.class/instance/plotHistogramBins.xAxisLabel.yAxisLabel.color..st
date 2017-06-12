accessing
plotHistogramBins: binNumber xAxisLabel: axisXLabel yAxisLabel: axixYLabel color: aColor

	| bins minPoint g ds |
	
	bins := self groupedBySeqLengthDistribution: binNumber.
	minPoint := ((bins reject: #isEmpty) detectMin: [ : c | c size ]) anyOne size.

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
		color: Color red;
		width: 25.
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
	" Open visualization in a new window "
	g open.