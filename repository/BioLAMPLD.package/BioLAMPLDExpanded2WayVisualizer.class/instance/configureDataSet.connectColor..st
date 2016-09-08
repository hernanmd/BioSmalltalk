private
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTData new.
	aDataSet connectColor: aColor.
	aDataSet dotShape circle size: 5.
	aDataSet 
		points: aCollection;
		connectUsing: (RTLine new color: (aColor alpha: 0.5); width: 4);
		minX: 7;
		maxX: 29.
	self grapher add: aDataSet.