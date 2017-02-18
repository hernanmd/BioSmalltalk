private
configureDataSet: aCollection connectColor: aColor

	| aDataSet |
	aDataSet := RTData new.
	"aDataSet connectColor: aColor."
	"aDataSet dotShape circle size: 5."
	aDataSet 
		points: aCollection;
		connectUsing: (RTLine new color: aColor; width: 0.5);
		x: #position;
		y: #average.
	self grapher add: aDataSet.