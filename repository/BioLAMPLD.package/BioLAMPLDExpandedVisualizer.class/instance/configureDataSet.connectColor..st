initialization
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTStackedDataSet new.
	aDataSet connectColor: aColor.
	aDataSet
		noDot;
		points: aCollection;
		x: (1 to: self snpCount).
	self grapher add: aDataSet.