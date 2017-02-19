private
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTData new.
	"aDataSet connectColor: aColor."
	"aDataSet dotShape circle size: 5."
	aDataSet 
		noDot;
		points: aCollection;
		connectUsing: (RTLine new color: aColor; width: self lineWidth);
		x: #position;
		y: #average.
	self grapher add: aDataSet.