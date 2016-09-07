private
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTData new.
	aDataSet connectColor: aColor.
	aDataSet dotShape circle size: 10.
	aDataSet 
		points: aCollection;
		connectUsing: (RTLine new color: (aColor alpha: 0.5); width: 5).
	self grapher add: aDataSet.