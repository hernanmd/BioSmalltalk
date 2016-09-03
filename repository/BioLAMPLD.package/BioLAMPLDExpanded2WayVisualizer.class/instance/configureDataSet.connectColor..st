private
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTDataSet new.
	aDataSet connectColor: aColor.
	self halt.
	aDataSet
		noDot;
		points: aCollection;
		minX: 1;
		maxX: self snpCount.
	self halt.
	self grapher add: aDataSet.