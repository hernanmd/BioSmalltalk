private
configureDataSet

	dataSet := RTDataSet new.
	dataSet dotShape color: Color blue.
	dataSet connectUsing: ((RTMultiLine new withVerticallAttachPoint; orthoHorizontal)
		color: (Color blue);
		width: 1;
		withHorizontalAttachPoint; 
		yourself).
	dataSet 
		points: parsedDataPoints;
		x: #x;
		y: #y.
	^ dataSet