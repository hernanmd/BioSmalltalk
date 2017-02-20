initialization
initializeTicks

	self grapher axisX 
		title: self axisXTitle;
		numberOfTicks: self numberOfXTicks;
		numberOfLabels: self numberOfXLabels.
	self grapher
		minX: self snpPositions first;
		withoutOrigin.
	self grapher axisY 
		color: Color black;
		title: self axisYTitle;
		numberOfTicks: self numberOfYTicks;
		noDecimal
