private
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTData new.
	aDataSet connectColor: aColor.
	aDataSet dotShape circle size: 5.
	aDataSet 
		points: aCollection;
		connectUsing: (RTLine new color: (aColor alpha: 0.5); width: 4);
		x: #position;
		y: #average.
	self grapher add: aDataSet.